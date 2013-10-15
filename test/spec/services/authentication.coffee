'use strict'

describe 'Service: AuthenticationService', ->

  # load the service's module
  beforeEach module 'findPlayApp'

  # instantiate service
  AuthenticationService = {}
  beforeEach inject (_AuthenticationService_) ->
    AuthenticationService = _AuthenticationService_

  it 'should do something', () ->
    expect(!!AuthenticationService).toBe true
