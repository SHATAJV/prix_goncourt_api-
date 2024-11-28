"""
This script serves as the entry point for the Prix Goncourt Flask application.

- It imports the Flask app creation function from the `prix_goncourt` package.
- Registers the Swagger UI blueprint to provide API documentation at the specified URL.
- Runs the application in debug mode when executed directly.

Usage:
    - Run this script to start the Flask server.


Key Components:
    - `create_app`: Initializes and configures the Flask application.
    - `swaggerui_blueprint`: Adds Swagger UI to the application for visualizing and testing API endpoints.
    - Debug Mode: The server runs in debug mode, which is suitable for development but should be disabled in production.

Entry Point:
    If this script is executed as the main program, the Flask app is started with:
        app.run(debug=True)
"""


from prix_goncourt import create_app
from prix_goncourt.api import swaggerui_blueprint, SWAGGER_URL

app = create_app()


app.register_blueprint(swaggerui_blueprint, url_prefix=SWAGGER_URL)

if __name__ == '__main__':
    app.run(debug=True)
