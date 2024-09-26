from flask import Flask

from prix_goncourt.dao import BookDAO, MembersDAO



def create_app():
    app = Flask(__name__)
    app.config.from_object('config.Config')

    # Initialisation des DAO
    app.book_dao = BookDAO()
    app.member_dao = MembersDAO()

    # Enregistrement des blueprints
    app.register_blueprint(book_bp)
    app.register_blueprint(member_bp)

    return app
