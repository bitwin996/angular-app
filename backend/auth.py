#!/usr/bin/env python

import endpoints
from protorpc import remote,messages,message_types

from models import User,UserMessage


class LoginRequest(messages.Message):
  email = messages.StringField(1, required=True)
  password = messages.StringField(2, required=False)

class AuthResponse(messages.Message):
  authenticated = messages.BooleanField(1, required=True)
  flash = messages.StringField(2, required=False)

class LogoutResponse(messages.Message):
  flash = messages.StringField(1, required=False)


# URL: /_ah/api/auth/v1
@endpoints.api(name='auth', version='v1', description='Auth API')
class AuthApi(remote.Service):

  #LOGIN_REQUEST = endpoints.ResourceContainer(
  #  message_types.VoidMessage,
  #  email = messages.StringField(1, required=True),
  #  password = messages.StringField(2, required=True)
  #  )

  #LOGIN_RESPONSE = endpoints.ResourceContainer(
  #    UserMessage,
  #    flash = messages.StringField(1, required=False)
  #    )

  # URL: /_ah/api/auth/v1/login
  @endpoints.method(LoginRequest, UserMessage, path='login', http_method='POST')
  def post_login(self, request):
    query = User.query(
        User.email == request.email,
        User.password == request.password)

    authenticated = query.count() > 0
    response = AuthResponse(authenticated = authenticated)

    if authenticated:
      user = query.get()
      return user.toMessage()
    else:
      raise endpoints.NotFoundException('Invalid username or password')

  # URL: /_ah/api/auth/v1/logout
  @endpoints.method(message_types.VoidMessage, LogoutResponse, path='logout', http_method='GET')
  def get_logout(self, request):
    return LogoutResponse(
        flash = 'Logged Out!!'
        )

