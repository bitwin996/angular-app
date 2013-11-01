'use strict'

describe 'Controller: MainController', ->

  # load the controller's module
  beforeEach module 'findPlayApp'

  MainController = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainController = $controller 'MainController', {
      $scope: scope
    }

  xit 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
