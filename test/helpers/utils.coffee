jsdom = require 'jsdom'

setupDom = () ->
    baseMarkup = '<!DOCTYPE html><html><head><title></title></head><body></body></html>'
    window = jsdom.jsdom(baseMarkup).parentWindow

    global.window = window
    global.document = window.document
    global.navigator = window.navigator

    return window

module.exports = setupDom: setupDom
