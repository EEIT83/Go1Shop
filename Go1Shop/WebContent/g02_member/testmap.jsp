<!DOCTYPE html>1
<html>
  <head>
    <style type="text/css">
      html, body, #map-canvas { height: 100%; margin: 0; padding: 0;}
    </style>
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js">
    </script>
    <script type="text/javascript">
      function initialize() {
        var mapOptions = {
          center: { lat: -34.397, lng: 150.644},
          zoom: 8
        };4
        var map = new google.maps.Map(
            document.getElementById('map-canvas'),
            mapOptions);5
      }
      google.maps.event.addDomListener(
          window, 'load', initialize);6
    </script>
  </head>
  <body>
<div id="map-canvas"></div>
  </body>
</html>