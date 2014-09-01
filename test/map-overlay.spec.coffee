jsdom = require 'jsdom'
assert = require('chai').assert
sinon = require('sinon')

google = require('../resources/google-maps-stub')

baseMarkup = '<html><head><title></title></head><body></body></html>'
window = jsdom.jsdom(baseMarkup).parentWindow
window.google = google

document = window.document
global.window = window
global.document = document

$ = require('jquery')

MapOverlay = require '../lib/map-overlay'

describe 'Map Overlay Tests', ->
    overlayLayer = document.createElement 'div'
    location = null
    overlayElement = null
    overlay = null
    sandbox = null

    setupStubs = () ->
        sandbox = sinon.sandbox.create()

        sandbox.stub(google.maps.OverlayView.prototype, 'getPanes').returns(
            overlayLayer: overlayLayer
        )

    beforeEach ->
        setupStubs()

        $('body').append(overlayLayer);

        location = new google.maps.LatLng()
        overlayElement = document.createElement 'div'
        overlayElement.className = 'overlay-view'

        overlay = new MapOverlay overlayElement, location

    afterEach ->
        sandbox.restore()
        $('body').empty()

    it 'should create an instance of a map overlay', ->
        assert.equal overlay.element, overlayElement
        assert.equal overlay.location, location
        assert overlay instanceof google.maps.OverlayView

    it 'should append the element into the dom when onAdd is called', ->
        overlay.onAdd()
        assert.equal $(overlayLayer).find('.overlay-view').length, 1
