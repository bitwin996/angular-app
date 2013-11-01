'use strict'

describe 'Service: flash', ->

  # load the service's module
  beforeEach module 'findPlayApp'

  # instantiate service
  FlashService = {}
  beforeEach inject (_FlashService_) ->
    FlashService = _FlashService_

  it 'should do something', ->
    expect(!!FlashService).toBe true
