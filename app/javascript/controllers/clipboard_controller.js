import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content", "button"];

  copy() {
    const text = this.contentTarget.textContent.trim();
    navigator.clipboard
      .writeText(text)
      .then(() => {
        this.buttonTarget.textContent = "Copied!";
        this.resetButtonText(); // Reset button after a delay
      })
      .catch((err) => {
        console.error("Could not copy text: ", err);
      });
  }

  resetButtonText() {
    setTimeout(() => {
      this.buttonTarget.textContent = "Copy";
    }, 2000); // Resets to "Copy" after 2 seconds
  }
}
