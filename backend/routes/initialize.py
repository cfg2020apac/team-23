from math import log
from flask import request, jsonify
from routes import *

logger = logging.getLogger(__name__)

data = {
   "events":{
      "sample":{
         "ageMax":0,
         "ageMin":0,
         "dateDeadline":0,
         "dateEvent":0,
         "datePost":0,
         "id":"0",
         "tag":"0",
         "thumbUrl":"0",
         "title":"0",
         "users":0,
         "usersMax":0
      }
   },
  "eventDetails":{
      "sample":{
         "desc":"this is description",
         "videoUrl":"youtube.url.or.googlevideo.com",
      }
   },
  "wishlist":{
      "id001":{
         "requestedBy":"userId001",
         "pointsDevoted":50,
         "approved": False
      }
   },
   "users":{
      "sample":{
         "age":0,
         "badge":{
            "milestoneA":"false"
         },
         "eventRecord":{
            "eventID1":0
         },
         "name":"0",
         "score":0,
         "wish":{
            "id001":{
               "pointDevoted":0,
               "wishName":"0"
            }
         }
      }
   }
}


@app.route('/init', methods=['GET'])
def initialize():
  keys = db.get().val()
  for k in keys:
    db.child(k).remove()
  db.set(data)
  
  return "Re-initialized!"