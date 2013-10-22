'use strict'

angular.module('findPlayApp')
  .controller 'MainController', [
    '$scope', '$location', 'AuthenticationService', 'expiry'
    ($scope, $location, AuthenticationService, expiry) ->

      $scope.logout = ->
        AuthenticationService.logout().success ->
          $location.path '/login'

      $scope.expiry = expiry.data.flash

  ]
