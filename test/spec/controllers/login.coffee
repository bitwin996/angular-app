'use strict'

describe 'Controller: LoginController', () ->

  # load the controller's module
  beforeEach module 'findPlayApp'

  LoginController = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    LoginController = $controller 'LoginController', {
      $scope: scope
    }

  xit 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
