// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

import "trix"
import "@rails/actiontext"

import "viewerjs"

document.addEventListener("DOMContentLoaded", () => {
  const gallery = document.getElementById('gallery'); // Replace 'gallery' with your element ID
  const viewer = new Viewer(gallery, {
    navbar: false,     // Hide the navbar
    toolbar: false,    // Hide the toolbar
    movable: false,
  });
});