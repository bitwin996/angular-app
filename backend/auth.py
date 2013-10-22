import endpoints
from protorpc import remote,messages,message_types
from gaesessions import get_current_session

from models import User,UserMessage

import logging


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

  # URL: /_ah/api/auth/v1/login
  @endpoints.method(LoginRequest, UserMessage, path='login', http_method='POST')
  def post_login(self, request):
    query = User.query(
        User.email == request.email,
        User.password == request.password)

    authenticated = query.count() > 0
    session = get_current_session()

    if authenticated:
      user = query.get()

      session.regenerate_id()
      user_id = session['user_id'] = user.key.urlsafe()

      return user.toMessage()
    else:
      user_id = session.pop('user_id')
      raise endpoints.NotFoundException('Invalid username or password')


  # URL: /_ah/api/auth/v1/logout
  @endpoints.method(message_types.VoidMessage, LogoutResponse, path='logout', http_method='GET')
  def get_logout(self, request):
    session = get_current_session()
    user_id = session.pop('user_id')
    logging.info(user_id)

    return LogoutResponse(
        flash = 'Logged Out!!'
        )

