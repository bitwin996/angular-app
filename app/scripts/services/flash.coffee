'use strict'

angular.module('findPlayApp')
  .factory 'FlashService', ['$rootScope', ($rootScope) ->
    # Service logic

    # Public API here
    {
      show: (message) ->
        $rootScope.flash = message

      clear: ->
        $rootScope.flash = ""
    }

  ]
