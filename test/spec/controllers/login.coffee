'use strict'

describe 'controller: LoginController', ->

  # load the controller's module
  beforeEach module 'findPlayApp'

  LoginController = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, $location, AuthenticationService, $httpBackend) ->
    @$location = $location
    @$httpBackend = $httpBackend
    @scope = $rootScope.$new()
    @redirect = spyOn $location, 'path'

    LoginController = $controller 'LoginController',
      $scope: @scope
      $location: $location
      AuthenticationService: AuthenticationService

  describe 'successfully logging in', ->
    xit 'should redirect you to /home', ->
      # arrange, act, assert

      # arrange
      @$httpBackend.expectPOST('/login', @scope.crendentials).respond 200
      @scope.credentials = email: 'test@gmail.com', password: 'aaa'

      # act
      @scope.login()
      @$httpBackend.flush()

      # assertion
      #expect(@$location.path).toHaveBeenCalledWith '/home'
      expect(@redirect).toHaveBeenCalledWith '/'

