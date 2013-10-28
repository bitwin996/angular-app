#!/usr/bin/env python

import datetime
import endpoints
from protorpc import remote,messages,message_types

from models.user import User,UserMessage,UsersMessage
from models.reservation import Reservation,ReservationMessage,ReservationsMessage


#class UsersMessage(messages.Message):
#  users = messages.MessageField(UserMessage, 1, repeated=True)

# URL: /_ah/api/fixtures/v1
@endpoints.api(name='fixtures', version='v1', description='Fixtures API')
class FixturesApi(remote.Service):

  # URL: /_ah/api/fixtures/v1/users
  @endpoints.method(message_types.VoidMessage, UsersMessage, path='users', http_method='GET', name='fixtures.users')
  def get_users(self, request):
    users = []

    for i in range(10):
      user = self.seed_user(i)
      users.append(user.toMessage())

    return UsersMessage(users=users)

  # URL: /_ah/api/fixtures/v1/reservations
  @endpoints.method(message_types.VoidMessage, ReservationsMessage, path='reservations', http_method='GET', name='fixtures.reservations')
  def get_users(self, request):
    reservations = []

    for i in range(10):
      reservation = self.seed_reservation(i)
      reservations.append(reservation.toMessage())

    return ReservationsMessage(reservations=reservations)


  #@classmethod
  def seed_user(self, i):
    email = 'test_' + str(i) + '@gmail.com'

    query = User.query(User.email == email)

    if query.count() > 0:
      user = query.get()

    else:
      user = User(
        email = 'test_' + str(i) + '@gmail.com',
        password = 'test' + str(i)
        )
      user.put()

    return user


  def seed_reservation(self, i):
    day_1 = 60 * 60 * 24
    reservation = Reservation(
      user = self.seed_user(i),
      started_at = datetime.datetime.now() + datetime.timedelta(days=1),
      finished_at = datetime.datetime.now() + datetime.timedelta(days=2),
      place = 'test place ' + str(i)
      )
    reservation.put()

    return reservation
