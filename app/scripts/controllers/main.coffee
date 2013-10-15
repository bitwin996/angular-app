'use strict'

angular.module('findPlayApp')
  .controller 'MainController', ['$scope', 'AuthenticationService', ($scope, AuthenticationService) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    $scope.logout = ->
      AuthenticationService.logout()
  ]
