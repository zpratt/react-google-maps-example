/**
 * @jsx React.DOM
 */

(function () {
    'use strict';

    var React = require('react');

    var Overlay = React.createClass({displayName: 'Overlay',
        render: function () {
            return React.DOM.p(null, "Hello World, ", this.props.phrase);
        }
    });

    module.exports = Overlay;
}());
