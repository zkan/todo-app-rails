import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox"
export default class extends Controller {
  update(e) {
    let checkbox = e.target
    let checked = checkbox.checked
    console.log("Updating the checkbox", checked)
  }
}
