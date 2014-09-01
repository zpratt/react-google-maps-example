jsdom = require 'jsdom'
assert = require('chai').assert

google = require('../resources/google-maps-stub')

baseMarkup = '<html><head><title></title></head><body></body></html>'
window = jsdom.jsdom(baseMarkup).parentWindow
window.google = google

document = window.document
global.window = window
global.document = document

MapOverlay = require '../lib/map-overlay'

describe 'Map Overlay Tests', ->
    location = null
    overlayElement = null
    overlay = null

    beforeEach ->
        location = new google.maps.LatLng()
        overlayElement = document.createElement 'div'
        overlay = new MapOverlay overlayElement, location

    it 'should create an instance of a map overlay', ->
        assert.equal overlay.element, overlayElement
        assert.equal overlay.location, location
        assert overlay instanceof google.maps.OverlayView
