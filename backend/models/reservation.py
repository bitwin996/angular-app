from google.appengine.ext import ndb
from google.appengine.ext.ndb import msgprop

from protorpc import remote,messages,message_types

from models.user import User,UserMessage

from inspect import getmembers
from pprint import pprint
#pprint (vars(self))


class ReservationMessage(messages.Message):
  id = messages.StringField(1, required=False)
  organizer = messages.MessageField(UserMessage, 2, required=False)
  started_at = message_types.DateTimeField(3, required=True)
  finished_at = message_types.DateTimeField(4, required=False)
  place = messages.StringField(5, required=False)

class ReservationsMessage(messages.Message):
  reservations = messages.MessageField(ReservationMessage, 1, repeated=True)


class Reservation(ndb.Model):
  organizer = ndb.StructuredProperty(User)
  started_at = ndb.DateTimeProperty(required=True)
  finished_at = ndb.DateTimeProperty(required=True)
  #minutes = ndb.IntegerProperty(required=False)
  place = ndb.StringProperty(required=True)
  created_at = ndb.DateTimeProperty(required=False, auto_now_add=True)
  updated_at = ndb.DateTimeProperty(required=False, auto_now=True)

  def toMessage(self):
    pprint(self.organizer)
    message = ReservationMessage(
      id = self.key.urlsafe(),
      organizer = self.organizer.toMessage() if self.organizer else None,
      started_at = self.started_at,
      finished_at = self.finished_at,
      place = self.place
      )
    return message
