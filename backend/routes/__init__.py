import os
from dotenv import load_dotenv
load_dotenv()

import logging
import json
import urllib

import pyrebase

config = {
  "apiKey": os.getenv("apiKey"),
  "authDomain": os.getenv("authDomain"),
  "databaseURL": os.getenv("databaseURL"),
  "storageBucket": os.getenv("storageBucket")
}

firebase = pyrebase.initialize_app(config)
db = firebase.database()

from flask import Flask
app = Flask(__name__)

from routes import initialize
from routes import users
from routes import events
from routes import eventDeats