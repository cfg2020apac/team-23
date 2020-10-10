from math import log
from flask import request, jsonify
from routes import *

logger = logging.getLogger(__name__)


@app.route('/eventDeats', methods=['POST'])
def updatrfhdfEvent():
  data = request.get_json()
  logging.info("data sent for evaluation {}".format(data))
  id = data.get("id")
  if not id:
    return "Failed. No valid ID found."
  
  attr = ["desc", "videoUrl"]
  
  res = {}
  for r in attr:
    attribute = data.get(r)
    if attribute:
      res[r] = attribute
      
  db.child("eventDetails").child(id).set(res)
  logging.info("My result :{}".format(res))
  return "Success."