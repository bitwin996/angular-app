from google.appengine.ext import ndb
from gaesessions import get_current_session

from models.user import User


class Auth():

  @classmethod
  def attempt(self, credentials):
    query = User.query(
        User.email == credentials['email'],
        User.password == credentials['password'])

    authenticated = query.count() > 0
    session = get_current_session()

    if authenticated:
      user = query.get()

      session.regenerate_id()
      session['user_id'] = user.key.urlsafe()

      return True
    else:
      user_id = session.pop('user_id')
      return False


  @classmethod
  def check(self):
    session = get_current_session()
    return session.has_key('user_id')


  @classmethod
  def user(self):
    session = get_current_session()
    user_id = session.get('user_id')

    if user_id:
      key = ndb.Key(urlsafe=user_id)
      user = key.get()
      return user
    else:
      return None


  @classmethod
  def logout(self):
    session = get_current_session()
    user_id = session.pop('user_id')

    return None


