from math import log
from flask import request, jsonify
from routes import *

logger = logging.getLogger(__name__)


@app.route('/events', methods=['POST'])
def getSingleEvent():
  id = request.get_json().get("id")
  if not id:
    return "Failed. No valid Id passed."
  user = db.child("events").child(id).get()
  if user:
    return user.val()


@app.route('/events-all', methods=['GET'])
def getEvents():
  users = db.child("events").get()
  return users.val()


@app.route('/events-edit', methods=['POST'])
def updateEvent():
  data = request.get_json()
  logging.info("data sent for evaluation {}".format(data))
  id = data.get("id")
  if not id:
    return "Failed. No valid ID found."
  
  attr = ["ageMax", "ageMin", "comment", "dateDeadline", "dateEvent", "datePost", "tag",
          "thumbUrl", "title", "users", "usersMax"]
  res = {}
  for r in attr:
    attribute = data.get(r)
    if attribute:
      res[r] = attribute
      
  db.child("events").child(id).set(res)
  logging.info("My result :{}".format(res))
  return "Success."