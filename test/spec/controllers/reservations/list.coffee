'use strict'

describe 'Controller: ReservationsListController', ->

  # load the controller's module
  beforeEach module 'findPlayApp'

  ReservationsListController = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ReservationsListController = $controller 'ReservationsListController', {
      $scope: scope
    }

  xit 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
