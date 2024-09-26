from flask import Blueprint, request, jsonify, render_template, redirect, url_for, flash, session
from prix_goncourt.dao import BookDAO, MembersDAO
from prix_goncourt.models import President, Jury
from prix_goncourt.models.member import Member


main = Blueprint('main', __name__)

# DAO instances
members_dao = MembersDAO()
book_dao = BookDAO()


@main.route('/')
def home():
    return render_template('base.html')


@main.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        data = request.form
        name = data.get('name')
        password = data.get('password')

        member_data = members_dao.get_member_by_name(name)
        if member_data and member_data['password'] == password:

            if member_data['role'] == 'president':
                member = President(member_data['name'], member_data['password'], member_data['id_member'])
            elif member_data['role'] == 'jury':
                member = Jury(member_data['name'], member_data['password'], member_data['id_member'])
            elif member_data['role'] == 'public':
                member = Member(member_data['name'], member_data['password'], member_data['id_member'])
            else:
                return jsonify({'message': 'Role inconnu'}), 400

            session['member_id'] = member.id_member
            session['role'] = member_data['role']
            flash(f"Bienvenue {member.name}", 'success')
            return redirect(url_for('main.dashboard'))
        else:
            flash('Identifiants incorrects', 'error')

    return render_template('login.html')

# Route pour le tableau de bord
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
    return redirect(url_for('main.login'))

