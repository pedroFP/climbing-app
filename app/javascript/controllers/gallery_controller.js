import { Controller } from "@hotwired/stimulus";
import "viewerjs"

// Connects to data-controller="gallery"
export default class extends Controller {
  static targets = ["gallery"]; // Define gallery as a target

  connect() {
    new Viewer(this.galleryTarget, {
      navbar: false,  // Hide the navbar
      toolbar: false, // Hide the toolbar
      movable: false, // Disable movable zommed images 
    });
  }
}
