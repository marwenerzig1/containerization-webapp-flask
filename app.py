from flask import Flask , render_template , request


app = Flask(__name__)

@app.route('/')
def main():
    return render_template('index.html')


@app.route('/how are you')
def good():
    return render_template('good.html')


if __name__=='__main__':
    app.run(debug=True) 