from flask import Flask, request
app = Flask(__name__)

@app.route('/hello')
def hello_world():
    headers = str(request.headers)
    return f'''<h1>Hello, from the Flask App in Docker!</h1>\n
    <p>{headers}</p>'''
