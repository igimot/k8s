from flask import Flask
import socket
import os

app = Flask(__name__)


@app.route('/')
def hello():
    html = "<h3>Hello {name}!</h3>" \
           "<b>Hostname: {hostname}</b><br/>" \
           "<b>IP: {ip}</b><br/>"

    return html.format(name=os.getenv("NAME", "World"), hostname=socket.gethostname(),
                       ip=socket.gethostbyname(socket.gethostname()))


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)