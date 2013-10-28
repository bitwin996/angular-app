import logging
import endpoints
from protorpc import remote,messages,message_types

from lib.auth import Auth

from models.reservation import Reservation,ReservationMessage,ReservationsMessage
from models.auth import AuthResponse,LogoutResponse


# URL: /_ah/api/reservations/v1
@endpoints.api(name='reservations', version='v1', description='Reservations API')
class ReservationsApi(remote.Service):

  # URL: /_ah/api/reservations/v1/query
  @endpoints.method(message_types.VoidMessage, ReservationsMessage, path='query', http_method='GET')
  def get_reservations(self, request):
    if not Auth.check():
      raise endpoints.UnauthorizedException('Please log in.')

    reservations = Reservation.query()

    messages = []
    for reservation in reservations:
      messages.append(reservation.toMessage())

    return ReservationsMessage(reservations = messages)
