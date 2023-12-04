import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slide"

export default class extends Controller {
  static targets = ['togglableElement']

  connect() {
  }

  scroll() {
    this.togglableElementTarget.classList.toggle("d-none");
  }


}
