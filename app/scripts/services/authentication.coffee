'use strict'

angular.module('findPlayApp')
  .factory 'AuthenticationService', ['$location', ($location) ->
    # Public API here
    login: (credentials) ->
      if credentials.email is 'test@gmail.com'
        $location.path '/'

    logout: ->
      $location.path '/login'
  ]
