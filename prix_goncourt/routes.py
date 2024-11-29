from flask import Blueprint, request, jsonify, render_template, redirect, url_for, flash, session
from werkzeug.security import check_password_hash

from .dao import BookDAO, MembersDAO


main = Blueprint('main', __name__)


members_dao = MembersDAO()
book_dao = BookDAO()


@main.route('/')
def home():
    return render_template('home.html')


@main.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        members_dao = MembersDAO()

        member = members_dao.get_member_by_name(username)

        if member and member['password'] == password:

            session['user_id'] = member['id_member']
            session['role'] = member['role']

            if member['role'] == 'president':
                return redirect(url_for('main.president_menu'))
            elif member['role'] == 'jury':
                return redirect(url_for('main.jury_menu'))
            else:
                return redirect(url_for('main.public_menu'))
        else:
            flash('Identifiants incorrects')

    return render_template('login.html')


@main.route('/dashboard')
def dashboard():
    if 'member_id' not in session:
        return redirect(url_for('main.login'))

    role = session.get('role')
    if role == 'jury':
        return redirect(url_for('main.jury_menu'))
    elif role == 'president':
        return redirect(url_for('main.president_menu'))
    elif role == 'public':
        return redirect(url_for('main.public_menu'))
    return render_template('base.html')


@main.route('/jury_menu')
def jury_menu():
    return render_template('jury_menu.html')


@main.route('/president_menu')
def president_menu():
    return render_template('president_menu.html')


@main.route('/public_menu')
def public_menu():
    return render_template('public_menu.html')


@main.route('/display_books', methods=['GET'])
def get_books():
    selection_number = request.args.get('selection', default=1, type=int)
    books = book_dao.get_books_by_selection(selection_number)
    return render_template('display_books.html', books=books, selection_number=selection_number)


@main.route('/logout')
def logout():
    session.pop('member_id', None)
    session.pop('role', None)
    flash('Vous êtes déconnecté.', 'success')
    return redirect(url_for('main.home'))


@main.route('/result_vote', methods=['GET'])
def result_vote():
    if 'role' not in session or session['role'] != 'president':
        return "Accès refusé", 403

    selection_number = request.args.get('selection_number', default=1, type=int)

    book_dao = BookDAO()
    vote_results = book_dao.get_vote_results_for_president(selection_number)

    return render_template('result_vote.html', vote_results=vote_results, selection_number=selection_number)


@main.route('/add_books_to_selection', methods=['GET', 'POST'])
def add_books_to_selection():
    if 'role' not in session or session['role'] != 'president':
        return "Accès refusé", 403

    book_dao = BookDAO()

    if request.method == 'POST':

        selection_number = request.form.get('selection_number')
        book_ids = request.form.getlist('book_ids')


        if selection_number and book_ids:
            book_dao.add_books_to_selection(selection_number, book_ids)
            flash('Les livres ont été ajoutés à la sélection avec succès.')
            return redirect(url_for('main.add_books_to_selection'))
        else:
            flash('Veuillez sélectionner une phase et au moins un livre.')

    all_books = book_dao.fetch_all_books()

    return render_template('add_selection.html', books=all_books)


@main.route('/vote', methods=['GET', 'POST'])
def vote():
    if 'role' not in session or session['role'] != 'jury':
        return "Accès refusé", 403

    selection_number = request.args.get('selection_number', default=1, type=int)
    book_dao = BookDAO()

    if request.method == 'POST':
        book_ids = request.form.getlist('book_ids')
        if book_ids:
            # Appeler la méthode pour enregistrer les votes
            for book_id in book_ids:
                book_dao.add_vote(selection_number, book_id, session['user_id'])
            flash('Vos votes ont été enregistrés avec succès.')
            return redirect(url_for('main.jury_menu'))

    books = book_dao.get_books_by_selection(selection_number)
    return render_template('jury_vote.html', books=books, selection_number=selection_number)
