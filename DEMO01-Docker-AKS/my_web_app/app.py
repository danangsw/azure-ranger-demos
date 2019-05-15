from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello():
    return "<b>Hello Binusian!</b> Today is May 3 2019, 10:00."
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")