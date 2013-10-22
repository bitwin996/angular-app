'use strict'

angular.module('findPlayApp')
  .controller 'MainController', [
    '$scope', '$location', 'AuthenticationService',
    ($scope, $location, AuthenticationService) ->

      $scope.logout = ->
        AuthenticationService.logout().success ->
          $location.path '/login'

  ]
