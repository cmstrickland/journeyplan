function lookup_initial(valuename) {
    var raw_value = $('#initial_' + valuename).val();
    coord = parseFloat(raw_value.trim());
    if (isNaN(coord)) {
        console.error("couldn't lookup " + valuename);
        coord = 0.0;
    }
    return coord
}




function build_map(latitude,longitude,div,zoom) {
    return new google.maps.Map(div, {
        center: {lat: latitude, lng: longitude},
        zoom: zoom,
        styles: [{
            featureType: 'poi',
            stylers: [{ visibility: 'off' }]
        }, {
            featureType: 'transit.station',
            stylers: [{ visibility: 'off' }]
        }],
        disableDoubleClickZoom: true
    });
}



function initMap() {
    var mapDiv = document.getElementById('map');
    var latitude = lookup_initial('latitude');
    var longitude = lookup_initial('longitude');
    var zoom = lookup_initial('zoom');
    var locations_field = $('#journey_locations');
    var locations = [];

    var map = build_map(latitude,longitude,mapDiv,zoom);


    var allowedBounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(51.3827,-0.3069),
        new google.maps.LatLng(51.6221,0.1051)
    );

    allowedBounds.containsPosition = function (position) {
        return this.contains(new google.maps.LatLng(position));
    }


    var lastValidCenter = map.getCenter();

    map.addListener('center_changed', function() {
        if (allowedBounds.contains(map.getCenter())) {
            lastValidCenter = map.getCenter();
            return;
        } else {
            map.panTo(lastValidCenter);
        }
    });

    map.addListener('click', function(e) {
        var position = { lat: e.latLng.lat(),
                         lng: e.latLng.lng() };
        if (allowedBounds.containsPosition(position)) {
            var marker = new google.maps.Marker({
                position: position,
                map: map
            });
            locations.push(position)
            locations_field.val(JSON.stringify(locations));
        }
    });
}
