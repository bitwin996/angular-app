import endpoints
from protorpc import remote,messages,message_types
#from gaesessions import get_current_session

from models.schedule import Schedule,ScheduleMessage
#from lib.auth import Auth

import logging


#class LoginRequest(messages.Message):
#  email = messages.StringField(1, required=True)
#  password = messages.StringField(2, required=False)
#
#class AuthResponse(messages.Message):
#  authenticated = messages.BooleanField(1, required=True)
#  flash = messages.StringField(2, required=False)
#
#class LogoutResponse(messages.Message):
#  flash = messages.StringField(1, required=False)


# URL: /_ah/api/schedules/v1
@endpoints.api(name='schedules', version='v1', description='Schedule API')
class AuthApi(remote.Service):

  # URL: /_ah/api/schedules/v1/query
  @endpoints.method(message_types.VoidMessage, ScheduleMessage, path='query', http_method='GET')
  def get_schedules(self, request):
    schedules = Schedule.query()
    for schedule in schedules:
      msgs.append(schedule.toMessage())

    return SchedulesMessage(schedules = msgs)
