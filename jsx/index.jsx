/**
 * @jsx React.DOM
 */

(function () {
    'use strict';

    var $ = require('jquery'),
        React = require('react'),
        Router = require('./lib/router.coffee'),
        OverlayView = require('./lib/overlay-component'),

        loadMap = require('./lib/load-map'),
        mapLoaded;

    mapLoaded = $(document).ready(loadMap.load);

    //mapLoaded.done().then(function (map) {
    //    var MapOverlay = require('./lib/map-overlay'),
    //
    //        overlayPoint = new google.maps.LatLng(40.01144663490021, -90.22767623046876),
    //        overlayElement = document.createElement('div'),
    //        mapOverlayView = new MapOverlay(overlayElement, overlayPoint);
    //
    //    React.renderComponent(<OverlayView phrase={'from a rendered component'} />, overlayElement);
    //    mapOverlayView.setMap(map);
    //});
}());
