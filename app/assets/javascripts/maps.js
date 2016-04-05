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

    map.addListener('click', function(e) {
        var position = { lat: e.latLng.lat(),
                         lng: e.latLng.lng() };
        var marker = new google.maps.Marker({
            position: position,
            map: map
        });
        locations.push(position)
        locations_field.val(JSON.stringify(locations));
    });
}
