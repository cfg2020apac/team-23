from math import log
from flask import request, jsonify
from routes import *

logger = logging.getLogger(__name__)

@app.route('/users', methods=['POST'])
def getSingleUser():
  id = request.get_json().get("id")
  if not id:
    return "Failed. No valid Id passed."
  user = db.child("users").child(id).get()
  if user:
    return user.val()


@app.route('/users-all', methods=['GET'])
def getUsers():
  users = db.child("users").get()
  return users.val()


@app.route('/users-edit', methods=['POST'])
def updateUser():
  data = request.get_json()
  logging.info("data sent for evaluation {}".format(data))
  id = data.get("id")
  if not id:
    return "Failed. No valid ID found."
  
  attr = ["name", "age", "score", "badge", "wish"]
  res = {}
  for r in attr:
    attribute = data.get(r)
    if attribute:
      res[r] = attribute
  
  db.child("users").child(id).set(res)
  
  logging.info("My result :{}".format(res))
  return "Success."