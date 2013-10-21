'use strict'

angular.module('findPlayApp', [])
  #.constant 'apiRootUrl', "http://localhost:8080/_ah/api/find-play/v1"
  .constant('apiRootUrl', "$API_ROOT_URL")

  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->

    $locationProvider.html5Mode true

    $routeProvider
      .when '/login',
        templateUrl: 'views/auth/login.html'
        controller: 'LoginController'
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainController'
      .otherwise
        redirectTo: '/login'
  ]
