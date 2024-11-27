from prix_goncourt_api.flask_prix_goncourt.prix_goncourt import create_app

app = create_app()

if __name__ == '__main__':
    app.run(debug=True)
