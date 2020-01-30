import mapboxgl from 'mapbox-gl'
import 'mapbox-gl/dist/mapbox-gl.css'

const initMapbox = () => {
  const mapElement = document.getElementById('map')

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey

    // Add Map
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11'
    })

    // Add markers
    const markers = JSON.parse(mapElement.dataset.markers)
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map)
    })
  }
}

export default initMapbox
