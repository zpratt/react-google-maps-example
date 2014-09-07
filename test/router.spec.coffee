jsdom = require 'jsdom'
assert = require('chai').assert
sinon = require 'sinon'
testUtils = require './helpers/utils.coffee'
window = testUtils.setupDom()

$ = require 'jquery'
Backbone = require 'backbone'
_ = require 'lodash'

Backbone.$ = $

Router = require '../lib/router.coffee'

describe 'Router Tests', ->
    sandbox = null
    router = null

    expectedComponents =
        components:
            'thoughts': ['thoughtType'],
            'question': ['questionType', 'questionId']

    expectedRouteParams =
        thoughtType: 'thoughts'
        questionType: 'question'
        questionId: 'question'

    expectedFragment = '(thoughts/:thoughtType)(/)(question/:questionType/:questionId)(/)'

    beforeEach ->
        sandbox = sinon.sandbox.create()

        sandbox.stub Backbone.Router.prototype, 'trigger'
        sandbox.spy Backbone.Router.prototype, 'route'

        router = new Router(expectedComponents)
        Backbone.history.start()
        Backbone.Router.prototype.trigger.reset()

    afterEach ->
        sandbox.restore()
        Backbone.history.stop()

    it 'should create an instance of a Backbone router', ->
        assert router instanceof Backbone.Router
        assert.strictEqual router.components, expectedComponents.components
        assert.deepEqual router.routeParams, expectedRouteParams

    it 'should dynamically register the route based on the components', ->
        expectedRouteName = 'component'

        sinon.assert.calledOnce Backbone.Router.prototype.route
        sinon.assert.calledWith(
            Backbone.Router.prototype.route
            expectedFragment
            expectedRouteName
        )

    it 'should trigger an event when a route is matched', ->
        expectedParam = 'sometype'

        router.navigate "/thoughts/#{expectedParam}", trigger: true

        sinon.assert.calledWith(
            Backbone.Router.prototype.trigger
            'thoughts-route-fired'
            sinon.match thoughtType: expectedParam
        )

    it 'should trigger an event when a subroute is matched', ->
        questionType = 'someQuestionType'
        questionId = _.random(1, 10).toString()

        router.navigate "question/#{questionType}/#{questionId}", trigger: true

        sinon.assert.calledWith(
            Backbone.Router.prototype.trigger
            'question-route-fired'
            sinon.match questionType: questionType, questionId: questionId
        )

    it 'should trigger an event for each component when a route is matched', ->
        thoughtType = 'sometype'
        questionType = 'someQuestionType'
        questionId = _.random(1, 10).toString()

        Backbone.Router.prototype.trigger.reset()

        router.navigate(
            "/thoughts/#{thoughtType}/question/#{questionType}/#{questionId}"
            trigger: true
        )

        sinon.assert.calledWith(
            Backbone.Router.prototype.trigger
            'thoughts-route-fired'
            sinon.match thoughtType: thoughtType
        )

        sinon.assert.calledWith(
            Backbone.Router.prototype.trigger
            'question-route-fired'
            sinon.match questionType: questionType, questionId: questionId
        )

    it 'should not trigger an event for a route that does not match a component', ->
        router.navigate 'doesnotexist/element', trigger: true

        sinon.assert.notCalled Backbone.Router.prototype.trigger

    it 'should not trigger an event for an incomplete route', ->
        router.navigate 'thoughts', trigger: true

        sinon.assert.notCalled Backbone.Router.prototype.trigger
