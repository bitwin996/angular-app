from google.appengine.ext import ndb
from google.appengine.ext.ndb import msgprop

from protorpc import remote,messages,message_types

class ScheduleMessage(messages.Message):
  id = messages.StringField(1, required=False)
  email = messages.StringField(2, required=True)
  password = messages.StringField(3, required=False)
  created_at = message_types.DateTimeField(4, required=False)
  updated_at = message_types.DateTimeField(5, required=False)

class Schedule(ndb.Model):
  #user = ndb
  email = ndb.StringProperty(required=True)
  password = ndb.StringProperty(required=True)
  created_at = ndb.DateTimeProperty(required=False, auto_now_add=True)
  updated_at = ndb.DateTimeProperty(required=False, auto_now=True)

  def toMessage(self):
    message = ScheduleMessage(
      id = self.key.urlsafe(),
      email = self.email
      )
    return message
