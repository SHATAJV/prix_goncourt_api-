from prix_goncourt import create_app
from prix_goncourt.api import swaggerui_blueprint, SWAGGER_URL

# Crée l'application Flask
app = create_app()

# Enregistre le blueprint Swagger après la création de l'application
app.register_blueprint(swaggerui_blueprint, url_prefix=SWAGGER_URL)

if __name__ == '__main__':
    app.run(debug=True)
