'use strict'

angular.module('findPlayApp')
  .factory 'AuthenticationService', ['$http', '$location', 'apiRootUrl', ($http, $location, apiRootUrl) ->
    # Public API here
    login: (credentials) ->
      #if credentials.email is 'test@gmail.com'
      #  $location.path '/'
      #return $http.post '/auth/login', credentials
      return $http.post apiRootUrl + '/auth/v1/login', credentials

    logout: ->
      #$location.path '/login'
      #return $http.get '/auth/logout'
      return $http.get apiRootUrl + '/auth/v1/logout'

  ]
