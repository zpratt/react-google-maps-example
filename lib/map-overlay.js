(function () {
    'use strict';

    var _ = require('lodash');

    function MapOverlay(element, location) {
        this.element = element;
        this.location = location;
    }

    MapOverlay.prototype = new google.maps.OverlayView();

    _.extend(MapOverlay.prototype, {
        onAdd: function () {
            var projection = this.getProjection();
        },

        draw: function () {

        }
    });

    module.exports = MapOverlay;
}());
