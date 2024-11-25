import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    latitude: Number,
    longitude: Number,
    thumbnail: String, 
    name: String,
    address: String,
    link: String
  }

  connect() {
    this.initMap();
  }

  initMap() {
    const location = { lat: this.latitudeValue, lng: this.longitudeValue };
    const map = new google.maps.Map(this.element, {
      zoom: 15,
      center: location,
    });
    const marker = new google.maps.Marker({
      position: location,
      map: map,
      title: "Location Name",
    });

    // Define the content for the custom card
    const infoWindowContent = `
      <div style="font-family: Arial, sans-serif; font-size: 14px; line-height: 1.5; max-width: 200px;">
        <img src="${this.thumbnailValue}" alt="HTML5 Doctor Logo" width="95%"/>
        <br />
        <strong>${this.nameValue}</strong><br>
        ${this.addressValue}
        <a href="${this.linkValue}" target="_blank">More Info</a>
      </div>
    `;

    // Create an InfoWindow instance
    const infoWindow = new google.maps.InfoWindow({
      content: infoWindowContent
    });

    infoWindow.open(map, marker);

    marker.addListener("click", () => {
      infoWindow.open(map, marker);
    });

  }
}
