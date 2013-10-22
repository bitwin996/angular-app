'use strict'

angular.module('findPlayApp')
  .factory 'AuthenticationService', [
    '$http', '$location', 'SessionService', 'apiRootUrl',
    ($http, $location, SessionService, apiRootUrl) ->

      # Service logic
      cacheSession = ->
        SessionService.set 'authenticated', true

      uncacheSession = ->
        SessionService.unset 'authenticated'

      # Public API here
      login: (credentials) ->
        login = $http.post apiRootUrl + '/auth/v1/login', credentials
        login.success cacheSession

      logout: ->
        logout = $http.get apiRootUrl + '/auth/v1/logout'
        logout.success uncacheSession

      isLoggedIn: ->
        return SessionService.get 'authenticated'

  ]
