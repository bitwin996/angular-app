from google.appengine.ext import ndb
from google.appengine.ext.ndb import msgprop

from protorpc import remote,messages,message_types

class UserMessage(messages.Message):
  id = messages.StringField(1, required=False)
  name = messages.StringField(2, required=False)
  email = messages.StringField(3, required=False)
  created_at = message_types.DateTimeField(4, required=False)
  updated_at = message_types.DateTimeField(5, required=False)

class User(ndb.Model):
  name = ndb.StringProperty(required=True)
  email = ndb.StringProperty(required=True)
  created_at = ndb.DateTimeProperty(required=False, auto_now_add=True)
  updated_at = ndb.DateTimeProperty(required=False, auto_now=True)

  def toMessage(self):
    message = UserMessage(
      id = self.key.urlsafe(),
      name = self.name,
      email = self.email,
      created_at = self.created_at,
      updated_at = self.updated_at
      )
    return message
