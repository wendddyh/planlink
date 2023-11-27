import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="venue"
export default class extends Controller {
  static targets =["content"]

  connect(){
    console.log(this.contentTarget)
  }


}
