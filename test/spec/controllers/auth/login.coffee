'use strict'

describe 'controller: AuthLoginController', ->

  # load the controller's module
  beforeEach module 'findPlayApp'

  AuthLoginController = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, $location, AuthenticationService, $httpBackend, apiRootUrl) ->
    @scope = $rootScope.$new()
    @$location = $location
    @$httpBackend = $httpBackend
    @redirect = spyOn $location, 'path'
    @apiRootUrl = apiRootUrl

    AuthLoginController = $controller 'AuthLoginController',
      $scope: @scope
      $location: $location
      AuthenticationService: AuthenticationService

  describe 'successfully logging in', ->
    it 'should redirect you to /home', ->
      # arrange, act, assert

      # arrange
      @$httpBackend.expectPOST(@apiRootUrl + '/auth/v1/login', @scope.crendentials).respond 200
      @scope.credentials = email: 'test@gmail.com', password: 'aaa'

      # act
      @scope.login()
      @$httpBackend.flush()

      # assertion
      #expect(@$location.path).toHaveBeenCalledWith '/home'
      expect(@redirect).toHaveBeenCalledWith '/'

