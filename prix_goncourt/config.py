import os


class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'this_is_a_secret_key'


    DB_HOST = os.environ.get('DB_HOST') or 'localhost'
    DB_USER = os.environ.get('DB_USER') or 'root'
    DB_PASSWORD = os.environ.get('DB_PASSWORD') or '1234shtaj'
    DB_NAME = os.environ.get('DB_NAME') or 'prix_goncourt'
