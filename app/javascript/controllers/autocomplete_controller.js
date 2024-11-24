import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.initAutocomplete();
  }

  initAutocomplete() {
    if (typeof google === "undefined" || !google.maps) {
      console.error("Google Maps API is not loaded.");
      return;
    }

    const input = this.element.querySelector("input");
    const autocomplete = new google.maps.places.Autocomplete(input);

    // Handle address selection
    autocomplete.addListener("place_changed", () => {
      autocomplete.getPlace();
    });
  }
}
