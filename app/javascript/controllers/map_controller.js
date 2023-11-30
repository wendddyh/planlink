import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  static targets = ["map", "list"];

  connect() {
    this.initializeMap();
    this.addMarkersToMap();
    this.fitMapToMarkers();
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
   mapboxgl: mapboxgl }))

  }

  initializeMap() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v10",
    });
     //Hide map initially
     this.mapToggle(false);
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_venue_html)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    });
  }
  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  toggleView() {
    const mapVisible = this.mapTarget.style.display !== "none";
    this.mapToggle(!mapVisible);
  }

  mapToggle(showMap) {
    if (showMap) {
      this.mapTarget.style.display ="block";
      this.listTarget.style.display ="none";
    } else {
      this.mapTarget.style.display ="none";
      this.listTarget.style.display ="block";
    }
  }
}
