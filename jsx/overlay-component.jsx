/**
 * @jsx React.DOM
 */

(function () {
    'use strict';

    var Overlay = React.createClass({
        render: function () {
            return <p>Hello World, {this.props.phrase}</p>;
        }
    });

    module.exports = Overlay;
}());
