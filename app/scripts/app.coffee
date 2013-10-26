'use strict'

angular.module('findPlayApp', [])
  .constant('apiRootUrl', "$API_ROOT_URL")
  #.constant 'apiRootUrl', "http://localhost:8080/_ah/api/find-play/v1"

  #.config(['$httpProvider', ($httpProvider) ->
  #  delete $httpProvider.defaults.headers.common["X-Requested-With"]
  #])

  .config(['$routeProvider', 'apiRootUrl', ($routeProvider, apiRootUrl) ->

    #$locationProvider.html5Mode true

    $routeProvider
      .when '/login',
        templateUrl: 'views/auth/login.html'
        controller: 'LoginController'
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainController'
        resolve:
          expiry: ($http) ->
            $http.get apiRootUrl + '/auth/v1/expiry'
      .otherwise
        redirectTo: '/login'
  ])

  .run(['$rootScope', '$location', 'AuthenticationService', 'FlashService',
    ($rootScope, $location, AuthenticationService, FlashService) ->
      routesThatRequireAuth = ['/']

      $rootScope.$on '$routeChangeStart', (event, next, current) ->
        #TODO
        #console.log $rootScope.$$phase
        #debugger
        if $location.path() in routesThatRequireAuth and not AuthenticationService.isLoggedIn()
          $location.path '/login'
          FlashService.show "Please log in to continue."
  ])

  .config(['$httpProvider', ($httpProvider) ->
    logOutUserOn401 = [
      '$location', '$q', 'SessionService', 'FlashService',
      ($location, $q, SessionService, FlashService) ->
        success = (response) ->
          response

        error = (response) ->
          if response.status is 401  # HTTP NotAuthorized
            SessionService.unset 'authenticated'
            FlashService.show response.data.flash
            $location.path '/login'
            $q.reject response

          else
            $q.reject response

        (promise) ->
          promise.then success, error
    ]
  ])

