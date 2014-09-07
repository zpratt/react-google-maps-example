/**
 * @jsx React.DOM
 */

(function () {
    'use strict';

    var React = require('react');

    var Overlay = React.createClass({
        render: function () {
            return <p>Hello World, {this.props.phrase}</p>;
        }
    });

    module.exports = Overlay;
}());
