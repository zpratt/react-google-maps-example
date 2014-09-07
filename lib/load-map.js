(function (root) {
    'use strict';

    var $ = require('jquery'),
        mapLoadedDeferred;

    function load() {
        var url = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyDSIvk8etmMk1JvZE38ziW_7S_wWad5qhw&' +
                    'callback=mapReady';

        mapLoadedDeferred = new $.Deferred();

        $(document).ready(function () {
            $.getScript(url);
        });
    }

    function initMap() {
        var mapInstanceDeferred = new $.Deferred();

        mapLoadedDeferred.done(function () {
            var google = require('./google-maps'),
                mapOptions = {
                    center: new google.maps.LatLng(40.01144663490021, -90.22767623046876),
                    zoom: 7
                },
                map = new google.maps.Map(
                    document.getElementById('map-container'),
                    mapOptions
                );

            google.maps.event.addListenerOnce(map, 'idle', function () {
                mapInstanceDeferred.resolve(map);
            });
        });

        return mapInstanceDeferred;
    }

    function mapReady() {
        mapLoadedDeferred.resolve();
    }

    root.mapReady = mapReady;

    module.exports = {
        load: load,
        initMap: initMap
    };

}(window || global));
