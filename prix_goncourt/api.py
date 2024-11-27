from flask import Blueprint, jsonify, request, abort
from prix_goncourt.dao import BookDAO  # Assurez-vous que ce chemin est correct
from flask_swagger_ui import get_swaggerui_blueprint

# Initialisation du Blueprint
api = Blueprint('api', __name__)

# Chemin pour Swagger
SWAGGER_URL = '/api/docs'  # URL où Swagger sera servi
API_URL = '/static/swagger.yaml'  # Chemin vers votre fichier swagger.yaml

# Initialisation de Swagger UI
swaggerui_blueprint = get_swaggerui_blueprint(
    SWAGGER_URL,
    API_URL,
    config={
        'app_name': "Prix Goncourt API"
    }
)

# DAO pour interagir avec les données des livres
book_dao = BookDAO()

# Routes de l'API
@api.route('/api', methods=['GET'])
def api_root():
    return jsonify({"message": "Bienvenue dans l'API Prix Goncourt"}), 200

@api.route('/api/books', methods=['GET'])
def get_books():
    try:
        books = book_dao.fetch_all_books()
        return jsonify(books), 200
    except Exception as e:
        abort(500, description=str(e))

@api.route('/api/books/<int:id>', methods=['GET'])
def get_book_by_id(id):
    """Récupérer un livre par son ID"""
    try:
        book = book_dao.get_book_by_id(id)
        if not book:
            abort(404, description="Livre non trouvé")
        return jsonify(book), 200
    except Exception as e:
        abort(500, description=str(e))

@api.route('/api/books/<slug_titre>', methods=['GET'])
def get_book_by_slug(slug_titre):
    """Récupérer un livre par son slug (titre unique)"""
    try:
        book = book_dao.get_book_by_slug(slug_titre)
        if not book:
            abort(404, description="Livre non trouvé")
        return jsonify(book), 200
    except Exception as e:
        abort(500, description=str(e))

@api.route('/api/selection/<int:no_selection>', methods=['GET'])
def get_selection(no_selection):
    """Récupérer les livres d'une sélection donnée"""
    try:
        books = book_dao.get_books_by_selection(no_selection)
        return jsonify({"selection": no_selection, "books": books}), 200
    except Exception as e:
        abort(500, description=str(e))

@api.route('/api/selection/<int:no_selection>', methods=['POST'])
def add_to_selection(no_selection):
    """Ajouter des livres à une sélection donnée"""
    try:
        data = request.get_json()

        # Validation : s'assurer que 'book_ids' est une liste d'entiers
        if not data or "book_ids" not in data or not isinstance(data["book_ids"], list):
            abort(400, description="Requête invalide, 'book_ids' requis sous forme de liste")

        book_ids = data["book_ids"]

        # Valider que tous les éléments de book_ids sont des entiers
        if not all(isinstance(book_id, int) for book_id in book_ids):
            abort(400, description="Tous les identifiants de livres doivent être des entiers")

        # Ajouter les livres à la sélection
        book_dao.add_books_to_selection(no_selection, book_ids)
        return jsonify({"message": "Livres ajoutés avec succès", "selection": no_selection}), 201

    except Exception as e:
        abort(500, description=str(e))
