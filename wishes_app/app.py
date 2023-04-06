from flask import Flask, render_template

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def index():
    """Main page with login/registration form."""
    return render_template('index.html')
#
#
# @app.route('/registration', methods=['GET', 'POST'])
# def user_registration():
#     """User registration."""
#     pass
#
#
# @app.route('/profile/<int:id>', methods=['GET'])
# def profile():
#     """Profile information only, with possibility add one relation"""
#     pass
#
#
# @app.route('/profile/<int:id>/relation', methods=['POST'])
# def profile():
#     """Form to connect two users as relation."""
#     pass
#
#
# @app.route('/wishes/<int:id>', methods=['GET'])
# def show_wishes():
#     """Show wishes of your soul mate."""
#     pass
#
#
# @app.route('/wishes/<int:id>/new_wish', methods=['POST'])
# def add_wish():
#     """Add your wish to show it for a soul mate."""
#     pass
