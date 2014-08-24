/**
 * @jsx React.DOM
 */

(function () {
    var React = require('react'),
        OverlayView = require('./lib/overlay-component');

    React.renderComponent(<OverlayView phrase={'from a rendered component'} />, document.getElementById('content'));
}());
