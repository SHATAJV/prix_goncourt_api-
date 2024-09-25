from flask import render_template
from app import app, connection

@app.route('/')
def index():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM prix_goncourt")
        resultats = cursor.fetchall()
    return render_template('index.html', resultats=resultats)