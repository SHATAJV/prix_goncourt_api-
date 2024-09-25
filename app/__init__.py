# app/__init__.py
from flask import Flask
import pymysql
from flask_login import LoginManager

app = Flask(__name__)
app.config.from_object('config.Config')

# Configurer pymysql pour la connexion à la base de données
connection = pymysql.connect(
    host=app.config['MYSQL_HOST'],
    user=app.config['MYSQL_USER'],
    password=app.config['MYSQL_PASSWORD'],
    db=app.config['MYSQL_DB'],
    cursorclass=pymysql.cursors.DictCursor
)

# Initialiser Flask-Login
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'

from app import routes, auth
