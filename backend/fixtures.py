#!/usr/bin/env python

import endpoints
from protorpc import remote,messages,message_types

from models import User,UserMessage

class UsersMessage(messages.Message):
  users = messages.MessageField(UserMessage, 1, repeated=True)

# URL: /_ah/api/fixtures/v1
@endpoints.api(name='fixtures', version='v1', description='Fixtures API')
class FixturesApi(remote.Service):

  # URL: /_ah/api/fixtures/v1/users
  @endpoints.method(message_types.VoidMessage, UsersMessage, path='users', http_method='GET', name='fixtures.users')
  def get_users(self, request):
    users = []
    for i in range(10):
      user = User(
        email = 'test_' + str(i) + '@gmail.com',
        password = 'test' + str(i)
        )
      user.put()
      users.append(user.toMessage())

    return UsersMessage(users=users)
