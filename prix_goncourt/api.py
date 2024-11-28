from flask import Blueprint, jsonify, request, abort
from prix_goncourt.dao import BookDAO
from flask_swagger_ui import get_swaggerui_blueprint

# Initialize the Blueprint
api = Blueprint('api', __name__)

# Swagger setup
SWAGGER_URL = '/api/docs'
API_URL = 'swagger.yaml'


# Swagger UI initialization
swaggerui_blueprint = get_swaggerui_blueprint(
    SWAGGER_URL,
    API_URL,
    config={
        'app_name': "Prix Goncourt API"
    }
)

# DAO for book data interaction
book_dao = BookDAO()


@api.route('/api', methods=['GET'])
def api_root():
    """
    Root endpoint for the API.

    **Description:**
    Returns a welcome message to confirm that the API is accessible.

    **Response:**
    - 200: Success with a JSON welcome message.
    """
    return jsonify({"message": " Prix Goncourt API"}), 200


@api.route('/api/books', methods=['GET'])
def get_books():
    """
    Retrieve all books.

    **Description:**
    Fetches a list of all books participating in the Prix Goncourt.

    **Response:**
    - 200: Success with a JSON array of books.
    - 500: Internal server error if the operation fails.
    """
    try:
        books = book_dao.fetch_all_books()
        return jsonify(books), 200
    except Exception as e:
        abort(500, description=str(e))


@api.route('/api/books/<int:id>', methods=['GET'])
def get_book_by_id(id):
    """
    Retrieve a book by its ID.

    **Description:**
    Fetches a book's details using its unique ID.

    **Parameters:**
    - `id` (int): The unique identifier of the book.

    **Response:**
    - 200: Success with a JSON object of the book details.
    - 404: Book not found.
    - 500: Internal server error if the operation fails.
    """
    try:
        book = book_dao.get_book_by_id(id)
        if not book:
            abort(404, description="Book not found")
        return jsonify(book), 200
    except Exception as e:
        abort(500, description=str(e))


@api.route('/api/books/<slug>', methods=['GET'])
def get_book_by_slug(slug):
    """
    Retrieve a book by its slug title.

    **Description:**
    Fetches a book's details using its slug (a unique title identifier).

    **Parameters:**
    - `slug_titre` (str): The slug of the book's title.

    **Response:**
    - 200: Success with a JSON object of the book details.
    - 404: Book not found.
    - 500: Internal server error if the operation fails.
    """
    try:
        book = book_dao.get_book_by_slug(slug)

        if not book:
            abort(404, description="Book not found")
        return jsonify(book), 200
    except Exception as e:
        abort(500, description=str(e))


@api.route('/api/selection/<int:no_selection>', methods=['GET'])
def get_selection(no_selection):
    """
    Retrieve books from a specific selection.

    **Description:**
    Fetches all books from a given selection by its unique number.

    **Parameters:**
    - `no_selection` (int): The unique number identifying the selection.

    **Response:**
    - 200: Success with a JSON object containing the selection and its books.
    - 500: Internal server error if the operation fails.
    """
    try:
        books = book_dao.get_books_by_selection(no_selection)
        return jsonify({"selection": no_selection, "books": books}), 200
    except Exception as e:
        abort(500, description=str(e))


@api.route('/api/selection/<int:no_selection>', methods=['POST'])
def add_to_selection(no_selection):
    """
    Add books to a specific selection.

    **Description:**
    Adds a list of book IDs to the specified selection.

    **Parameters:**
    - `no_selection` (int): The unique number identifying the selection.
    - JSON body containing:
      - `book_ids` (list[int]): A list of book IDs to add to the selection.

    **Response:**
    - 201: Success with a confirmation message.
    - 400: Invalid request (e.g., missing or incorrect data).
    - 500: Internal server error if the operation fails.
    """
    try:
        data = request.get_json()

        if not data or "book_ids" not in data or not isinstance(data["book_ids"], list):
            abort(400, description="Invalid request, 'book_ids' is required as a list")

        book_ids = data["book_ids"]

        if not all(isinstance(book_id, int) for book_id in book_ids):
            abort(400, description="All book IDs must be integers")

        book_dao.add_books_to_selection(no_selection, book_ids)
        return jsonify({"message": "Books successfully added", "selection": no_selection}), 201

    except Exception as e:
        abort(500, description=str(e))

