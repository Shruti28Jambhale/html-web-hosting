from flask import Flask, send_file
import os

app = Flask(__name__)

@app.route('/')
def hello_geek():
    return '<h1>Hello from Flask & Docker</h1>'

@app.route('/index')
def index():
    return send_file(os.path.join(app.root_path, 'index.html'))

if __name__ == "__main__":
    app.run(debug=True)
