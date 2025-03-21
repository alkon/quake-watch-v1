from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hi, app!'

@app.route('/health')
def health_check():
    return 'OK', 200

if __name__ == '__main__':
    port = int(os.environ.get('APP_PORT', 5000)) # Get port from env, default 5000
    app.run(host='0.0.0.0', port=port)
