'use strict'

angular.module('findPlayApp', [])
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
