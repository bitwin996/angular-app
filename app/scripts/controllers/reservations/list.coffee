'use strict'

angular.module('findPlayApp')
  .controller 'ReservationsListController', [
    '$scope', 'reservations',
    ($scope, reservations) ->

      $scope.reservations = reservations.data.reservations

      #$scope.console = ->
      #  console.log $scope.reservations
      #$scope.console()

  ]
