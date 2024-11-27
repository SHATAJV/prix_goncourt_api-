from flask import Flask
from .api import api as api_blueprint
from .routes import main as main_blueprint

def create_app():
    app = Flask(__name__)
    app.secret_key = 'Dev'

    # Enregistrer les blueprints
    app.register_blueprint(api_blueprint)
    app.register_blueprint(main_blueprint)

    return app
