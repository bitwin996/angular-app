'use strict'

describe 'Service: flash', () ->

  # load the service's module
  beforeEach module 'findPlayApp'

  # instantiate service
  flash = {}
  beforeEach inject (_flash_) ->
    flash = _flash_

  it 'should do something', () ->
    expect(!!flash).toBe true
