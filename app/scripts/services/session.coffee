'use strict'

angular.module('findPlayApp')
  .factory 'SessionService', () ->
    # Public API here
    {
      get: (key) ->
        sessionStorage.getItem key

      set: (key, val) ->
        sessionStorage.setItem key, val

      unset: (key) ->
        sessionStorage.removeItem key
    }
