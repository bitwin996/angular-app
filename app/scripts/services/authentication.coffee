'use strict'

angular.module('findPlayApp')
  .factory 'AuthenticationService', [
    '$http', '$location', 'SessionService', 'FlashService', 'apiRootUrl',
    ($http, $location, SessionService, FlashService, apiRootUrl) ->

      # Service logic
      cacheSession = ->
        SessionService.set 'authenticated', true

      uncacheSession = ->
        SessionService.unset 'authenticated'

      loginError = (response) ->
        FlashService.show response.error.message

      # Public API here
      login: (credentials) ->
        login = $http.post apiRootUrl + '/auth/v1/login', credentials
        login.success cacheSession
        login.success FlashService.clear
        login.error loginError

      logout: ->
        logout = $http.get apiRootUrl + '/auth/v1/logout'
        logout.success uncacheSession

      isLoggedIn: ->
        SessionService.get 'authenticated'

  ]
