import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slide"

export default class extends Controller {
  static targets = ['content']

  connect() {
    console.log("hello")
  }

  slideUp() {
    this.contentTarget.classList.Toggle("content");
  }

  slideDown() {
    this.contentTarget.classList.remove('slide-up');
  }
}
