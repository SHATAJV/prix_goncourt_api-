import mysql.connector
from flask import current_app, g

def get_db_connection():
    """
    Returns the MySQL database connection object.
    Creates a new connection if it doesn't already exist in Flask's g context.
    """
    if 'db' not in g:
        g.db = mysql.connector.connect(
            host=current_app.config['DB_HOST'],
            user=current_app.config['DB_USER'],
            password=current_app.config['DB_PASSWORD'],
            database=current_app.config['DB_NAME']
        )
    return g.db

def close_db_connection(e=None):
    """
    Close the database connection at the end of the request.
    """
    db = g.pop('db', None)
    if db is not None:
        db.close()
