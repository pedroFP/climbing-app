import { Controller } from "@hotwired/stimulus";
import "viewerjs";

// Connects to data-controller="gallery"
export default class extends Controller {
  static targets = ["gallery"]; // Define gallery as a target

  connect() {
    new Viewer(this.galleryTarget, {
      navbar: false, // Hide the navbar
      toolbar: false, // Hide the toolbar
      touch: true, // Ensure touch events are enabled (should be enabled by default)
    });
  }
}
