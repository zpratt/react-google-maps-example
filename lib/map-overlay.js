(function () {
    'use strict';

    var _ = require('lodash'),
        google = require('./google-maps');

    function MapOverlay(element, location) {
        this.element = element;
        this.location = location;
    }

    MapOverlay.prototype = new google.maps.OverlayView();

    _.extend(MapOverlay.prototype, {
        onAdd: function () {
            var panes = this.getPanes();

            panes.overlayLayer.appendChild(this.element);
        },

        draw: function () {
            var projection = this.getProjection(),
                point = projection.fromLatLngToDivPixel(this.location);

            this.element.style.top = point.y + 'px';
            this.element.style.left = point.x + 'px';
        }
    });

    module.exports = MapOverlay;
}(window || global));
