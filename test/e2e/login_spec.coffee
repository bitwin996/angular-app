'use strict'

describe 'E2E: Login', ->

  #beforeEach ->
  #  global.browser.driver = new webdriver.Builder().
  #    withCapabilities(webdriver.Capabilities.phantomjs()).build()

  beforeEach ->
    #browser.get 'http://localhost:9000/'
    browser.get '/'
    #console.log global.browser.driver

  describe 'when the user logs in', ->
    it 'should redirect he to the main page and he should see a message', ->
      element(global.by.input 'credentials.email').sendKeys 'test_1@gmail.com'
      element(global.by.input 'credentials.password').sendKeys 'test1'

      element(global.by.id 'log-in').click()
      element(global.by.binding '{{ message }}').getText().then (text) ->
        expect(text).toEqual 'foobar'

