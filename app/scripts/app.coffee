'use strict'

angular.module('findPlayApp', [])
  .config ['$routeProvider', ($routeProvider) ->
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
