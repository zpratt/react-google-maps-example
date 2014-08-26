/**
 * @jsx React.DOM
 */

(function () {
    var React = require('react'),
        Router = require('./lib/router.coffee'),
        OverlayView = require('./lib/overlay-component');

    React.renderComponent(<OverlayView phrase={'from a rendered component'} />, document.getElementById('content'));
}());
