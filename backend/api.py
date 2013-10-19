#!/usr/bin/env python
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import logging
#from google.appengine.ext import endpoints
import endpoints
from protorpc import remote,messages,message_types

#from account import User,Account


class LoginMessage(messages.Message):
  isAuth = messages.BooleanField(1, required=True)


# URL: /_ah/api/find-play/v1
@endpoints.api(name='find-play', version='v1', description='FindPlay API')
class FindPlayApi(remote.Service):

  # URL: /_ah/api/find-play/v1/login
  @endpoints.method(message_types.VoidMessage, LoginMessage, path='login', http_method='GET')
  def get_login(self, request):
    result = LoginMessage(
      isAuth = True
      )
    return result

"""
  # URL: /_ah/api/find-play/v1/account
  @endpoints.method(Account, Account, path='account', http_method='GET')
  def get_account(self, request):
    key = 'aaaa'
    account = Account(
      id = key,
      name = 'test user',
      email = 'test@gmail.com'
      )
    return account

  # URL: /_ah/api/find-play/v1/account
  @endpoints.method(Account, Account, path='account', http_method='POST')
  def post_account(self, request):
    user = User(
      name = request.name,
      email = request.email
      )

    key = user.put()
    return user.toMessage()
"""


app = endpoints.api_server([FindPlayApi], restricted=False)
