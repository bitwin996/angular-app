'use strict'

angular.module('findPlayApp')
  .controller 'AuthLoginController', [
    '$scope', '$location', 'AuthenticationService',
    ($scope, $location, AuthenticationService) ->

      window.scope = $scope

      $scope.credentials = email: '', password: ''

      onLoginSuccess = ->
        $location.path '/'

      $scope.login = ->
        AuthenticationService.login($scope.credentials).success onLoginSuccess

  ]
