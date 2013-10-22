'use strict'

angular.module('findPlayApp', [])
  .constant('apiRootUrl', "$API_ROOT_URL")
  #.constant 'apiRootUrl', "http://localhost:8080/_ah/api/find-play/v1"

  .config(['$routeProvider', '$locationProvider',
    ($routeProvider, $locationProvider) ->

      $locationProvider.html5Mode true

      $routeProvider
        .when '/login',
          templateUrl: 'views/auth/login.html'
          controller: 'LoginController'
        .when '/',
          templateUrl: 'views/main.html'
          controller: 'MainController'
        .otherwise
          redirectTo: '#/login'
  ])

  .run(['$rootScope', '$location', 'AuthenticationService',
    ($rootScope, $location, AuthenticationService) ->
      $rootScope.$on '$routeChangeStart', (event, next, current) ->
        routesThatRequireAuth = ['/home']
        if $location.path() in routesThatRequireAuth and not AuthenticationService.isLoggedIn()
          $location.path '#/login'
  ])

