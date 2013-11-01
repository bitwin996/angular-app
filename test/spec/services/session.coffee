'use strict'

describe 'Service: session', ->

  # load the service's module
  beforeEach module 'findPlayApp'

  # instantiate service
  SessionService = {}
  beforeEach inject (_SessionService_) ->
    SessionService = _SessionService_

  it 'should do something', ->
    expect(!!SessionService).toBe true
