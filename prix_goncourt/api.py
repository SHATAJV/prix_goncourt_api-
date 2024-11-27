from flask import Blueprint, jsonify, request, abort
from prix_goncourt.dao import BookDAO

api = Blueprint('api', __name__)
book_dao = BookDAO()


# [GET] /api/books : liste des livres
@api.route('/api/books', methods=['GET'])
def get_books():
    books = book_dao.fetch_all_books()
    return jsonify(books), 200


# [GET] /api/books/<id> : livre par ID
@api.route('/api/books/<int:id>', methods=['GET'])
def get_book_by_id(id):
    book = book_dao.get_book_by_id(id)
    if not book:
        abort(404, description="Livre non trouvé")
    return jsonify(book), 200


# [GET] /api/books/<slug_titre> : livre par slug
@api.route('/api/books/<slug_titre>', methods=['GET'])
def get_book_by_slug(slug_titre):
    book = book_dao.get_book_by_slug(slug_titre)
    if not book:
        abort(404, description="Livre non trouvé")
    return jsonify(book), 200


# [GET] /api/selection/<no_selection> : livres pour une sélection
@api.route('/api/selection/<int:no_selection>', methods=['GET'])
def get_selection(no_selection):
    books = book_dao.get_books_by_selection(no_selection)
    if not books:
        abort(404, description="Sélection non trouvée")
    return jsonify({"selection": no_selection, "books": books}), 200

# [POST] /api/selection/<no_selection> : ajouter des livres à une sélection


@api.route('/api/selection/<int:no_selection>', methods=['POST'])
def add_to_selection(no_selection):
    data = request.get_json()
    if not data or "book_ids" not in data:
        abort(400, description="Requête invalide, 'book_ids' requis")

    book_ids = data["book_ids"]
    try:
        book_dao.add_books_to_selection(no_selection, book_ids)
        return jsonify({"message": "Livres ajoutés avec succès", "selection": no_selection}), 201
    except Exception as e:
        abort(500, description=str(e))
