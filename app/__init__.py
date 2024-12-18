from flask import Flask
from flask_sqlalchemy import SQLAlchemy

print("init.py has started")

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.secret_key = "your_secret_key"
    app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///users.db"
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
    
    db.init_app(app)

    with app.app_context():
        from . import routes
        from .models import User
        db.create_all()
    
    return app
