import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="pick-attendees"
export default class extends Controller {
  connect() {
    console.log("Connected to the attendances controller");
  }

  handleClick(event) {
    event.preventDefault();
    if (confirm("Are you sure you want to add this guest?")) {
      const userId = event.target.dataset.userId;
      console.log(userId);
    }
  }
}
