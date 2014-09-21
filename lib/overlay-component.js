(function () {
    'use strict';

    var React = require('react');

    var Overlay = React.createClass({
        render: function () {
            return React.DOM.p(null, this.props.phrase);
        }
    });

    module.exports = Overlay;
}());
