import endpoints
from protorpc import remote,messages,message_types
from gaesessions import get_current_session

from models.user import User,UserMessage
from models.auth import AuthResponse,LogoutResponse
from lib.auth import Auth

import logging

from inspect import getmembers
from pprint import pprint


class LoginRequest(messages.Message):
  email = messages.StringField(1, required=True)
  password = messages.StringField(2, required=False)


# URL: /_ah/api/auth/v1
@endpoints.api(name='auth', version='v1', description='Auth API')
class AuthApi(remote.Service):

  # URL: /_ah/api/auth/v1/login
  @endpoints.method(LoginRequest, UserMessage, path='login', http_method='POST')
  def post_login(self, request):
    #self.response.headers['Access-Control-Allow-Origin'] = '*'
    #self.response.headers['Access-Control-Allow-Methods'] = '*'
    #pprint (vars(self))

    if Auth.attempt({'email':request.email, 'password':request.password}):
      return Auth.user().toMessage()
    else:
      raise endpoints.NotFoundException('Invalid username or password')


  # URL: /_ah/api/auth/v1/logout
  @endpoints.method(message_types.VoidMessage, LogoutResponse, path='logout', http_method='GET')
  def get_logout(self, request):
    Auth.logout()
    return LogoutResponse(flash = 'Logged Out!!')


  # URL: /_ah/api/auth/v1/expiry
  # Obsoleted
  @endpoints.method(message_types.VoidMessage, LogoutResponse, path='expiry', http_method='GET')
  def get_expiry(self, request):
    #TODO
    return LogoutResponse(flash = 'all is good')
    #raise endpoints.UnauthorizedException('Your session has expired, please log in.')

