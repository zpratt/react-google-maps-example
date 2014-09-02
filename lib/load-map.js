(function (root) {
    'use strict';

    var $ = require('jquery');

    function load() {
        var mapLoadedDeferred = new $.Deferred(),
            url = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyDSIvk8etmMk1JvZE38ziW_7S_wWad5qhw&' +
                    'callback=initMap';

        $.getScript(url).done(mapLoadedDeferred.resolve);
    }

    function initMap() {
        var google = require('./google-maps'),
            mapLoadedDeferred = new $.Deferred(),
            mapOptions = {
                center: new google.maps.LatLng(40.01144663490021, -90.22767623046876),
                zoom: 7
            },
            map = new google.maps.Map(
                document.getElementById('map-container'),
                mapOptions
            );

        google.maps.event.addListenerOnce(map, 'idle', function () {
            mapLoadedDeferred.resolve(map);
        });
        //google.maps.event.addDomListener(window, 'load', initialize);
        return mapLoadedDeferred;
    }

    root.initMap = initMap;

    module.exports = {
        load: load
    };

}(window || global));
