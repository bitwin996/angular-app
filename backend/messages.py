from protorpc import remote,messages,message_types

class LoginMessage(messages.Message):
  isAuth = messages.BooleanField(1, required=True)
