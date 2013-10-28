'use strict'

angular.module('findPlayApp')
  .factory 'AuthenticationService', [
    '$http', '$sanitize', 'SessionService', 'FlashService', 'apiRootUrl',
    ($http, $sanitize, SessionService, FlashService, apiRootUrl) ->

      # Service logic
      cacheSession = ->
        SessionService.set 'authenticated', true

      uncacheSession = ->
        SessionService.unset 'authenticated'

      loginError = (response) ->
        FlashService.show response.error.message

      sanitizeCredentials = (credentials) ->
        email: $sanitize credentials.email
        password: $sanitize credentials.password
        #csrf_token: CSRF_TOKEN

      # Public API here
      login: (credentials) ->
        login = $http.post apiRootUrl + '/auth/v1/login', sanitizeCredentials(credentials)
        login.success cacheSession
        login.success FlashService.clear
        login.error loginError

      logout: ->
        logout = $http.get apiRootUrl + '/auth/v1/logout'
        logout.success uncacheSession

      isLoggedIn: ->
        SessionService.get 'authenticated'

  ]
