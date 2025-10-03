# Add to this file for the sample app lab
from flask import Flask
from flask import request
from flask import render_template

app = Flask(__name__)

@app.route("/")
def home():
    client_ip = request.remote_addr
    return render_template("index.html", client_ip=client_ip)

@app.route("/about")
def about():
    return render_template("about.html")

if __name__ == "__main__":
    sample.run(host="0.0.0.0", port=5050)
