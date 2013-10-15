'use strict'

angular.module('findPlayApp')
  .controller 'LoginController', ['$scope', 'AuthenticationService', ($scope, AuthenticationService) ->
    window.scope = $scope
    $scope.credentials = email: '', password: ''

    $scope.login = ->
      AuthenticationService.login $scope.credentials
  ]
