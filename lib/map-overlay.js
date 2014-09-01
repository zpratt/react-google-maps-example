(function (root) {
    'use strict';

    var _ = require('lodash'),
        $ = require('jquery'),
        google = require('./google-maps');

    function MapOverlay(element, location) {
        this.element = element;
        this.location = location;
    }

    MapOverlay.prototype = new google.maps.OverlayView();

    _.extend(MapOverlay.prototype, {
        //onAdd: function () {
        //    var projection = this.getProjection();
        //},
        //
        //draw: function () {
        //
        //}
    });

    module.exports = MapOverlay;
}(window || global));
