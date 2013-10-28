from protorpc import remote,messages,message_types


class AuthResponse(messages.Message):
  authenticated = messages.BooleanField(1, required=True)
  flash = messages.StringField(2, required=False)

class LogoutResponse(messages.Message):
  flash = messages.StringField(1, required=False)

