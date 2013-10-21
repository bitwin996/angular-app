#!/usr/bin/env python

import endpoints
from protorpc import remote,messages,message_types

from models import User,UserMessage


class LoginRequest(messages.Message):
  email = messages.StringField(1, required=True)
  password = messages.StringField(2, required=False)

class AuthResponse(messages.Message):
  authenticated = messages.BooleanField(1, required=True)


# URL: /_ah/api/auth/v1
@endpoints.api(name='auth', version='v1', description='Auth API')
class AuthApi(remote.Service):

  #LOGIN_REQUEST = endpoints.ResourceContainer(
  #  message_types.VoidMessage,
  #  email = messages.StringField(1, required=True),
  #  password = messages.StringField(2, required=True)
  #  )

  # URL: /_ah/api/auth/v1/login
  @endpoints.method(LoginRequest, AuthResponse, path='login', http_method='POST')
  def post_login(self, request):
    query = User.query(
        User.email == request.email,
        User.password == request.password)

    authenticated = query.count() > 0
    return AuthResponse(authenticated = authenticated)
