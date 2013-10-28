'use strict'

angular.module('findPlayApp')
  .controller 'AuthLoginController', [
    '$scope', '$location', 'AuthenticationService',
    ($scope, $location, AuthenticationService) ->
      window.scope = $scope
      $scope.credentials = email: '', password: ''

      $scope.login = ->
        AuthenticationService.login($scope.credentials).success ->
          $location.path '/'
  ]
