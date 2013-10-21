'use strict'

angular.module('findPlayApp')
  .factory 'AuthenticationService', ['$http', '$location', ($http, $location) ->
    # Public API here
    login: (credentials) ->
      #if credentials.email is 'test@gmail.com'
      #  $location.path '/'
      return $http.post '/auth/login', credentials

    logout: ->
      #$location.path '/login'
      return $http.get '/auth/logout'

  ]
