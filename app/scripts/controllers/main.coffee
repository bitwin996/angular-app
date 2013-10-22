'use strict'

angular.module('findPlayApp')
  .controller 'MainController', [
    '$scope', '$location', 'AuthenticationService',
    ($scope, $location, AuthenticationService) ->
      $scope.awesomeThings = [
        'HTML5 Boilerplate'
        'AngularJS'
        'Karma'
      ]

      $scope.logout = ->
        AuthenticationService.logout().success ->
          $location.path '/login'
  ]
