#!/usr/bin/env python

from protorpc import messages
from google.appengine.ext import ndb
from google.appengine.ext.ndb import msgprop

from google.appengine.api import mail


class Account(messages.Message):
  id = messages.StringField(1, required=False)
  name = messages.StringField(2, required=True)
  email = messages.StringField(3, required=False)

class User(ndb.Model):
  name = ndb.StringProperty(required=True)
  email = ndb.StringProperty(required=True)

  def toMessage(self):
    msg = Account(
        id = self.key.urlsafe(),
        name = self.name,
        email = self.email
        )
    return msg

class AccountMessage(messages.Message):
  data = messages.MessageField(Account, 1)
