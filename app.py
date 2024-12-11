from app import create_app

app = create_app()
print ("app.py has started")

if __name__ == "__main__":
    app.run(debug=True)
    print("app.py has run")
