from google.appengine.ext import ndb
from google.appengine.ext.ndb import msgprop

from protorpc import remote,messages,message_types

from models.user import User,UserMessage

class ReservationMessage(messages.Message):
  id = messages.StringField(1, required=False)
  user = messages.MessageField(UserMessage, 2)
  started_at = message_types.DateTimeField(3, required=True)
  finished_at = message_types.DateTimeField(4, required=False)
  place = messages.StringField(5, required=False)


class Reservation(ndb.Model):
  user = ndb.StructuredProperty(User)
  started_at = ndb.DateTimeProperty(required=True)
  finished_at = ndb.DateTimeProperty(required=True)
  #minutes = ndb.IntegerProperty(required=False)
  place = ndb.StringProperty(required=True)
  created_at = ndb.DateTimeProperty(required=False, auto_now_add=True)
  updated_at = ndb.DateTimeProperty(required=False, auto_now=True)

  def toMessage(self):
    message = ReservationMessage(
      id = self.key.urlsafe(),
      user = self.user.toMessage(),
      started_at = self.started_at,
      finished_at = self.finished_at,
      place = self.place
      )
    return message
