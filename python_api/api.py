#!C:\Users\Dell\AppData\Local\Programs\Python\Python39\python.exe
import flask
from flask import jsonify
from flask import request
from recommend import *


app = flask.Flask(__name__)
app.config["DEBUG"] = True


@app.route('/python_api', methods=['POST'])
def api_all():
    data = request.get_json()
    user_id = data['user_id']
    post_id = data['post_id']
    rating = data['rating']
    added_by = data['added_by']
    body = data['body']
    data = [
        [user_id, post_id, rating,added_by, body]
    ]
    prediction = find_similar_users(data)
    # print(prediction)
    return jsonify(prediction)



app.run()
