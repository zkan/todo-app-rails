import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from "@rails/request.js"

// Connects to data-controller="checkbox"
export default class extends Controller {
  static values = { url: String }

  async update(e) {
    let checkbox = e.target
    let checked = checkbox.checked
    console.log("Updating the checkbox", checked)

    const request = new FetchRequest("put", this.urlValue, {
      body: JSON.stringify({ is_completed: checked }),
      responseKind: "turbo-stream"
    })
    await request.perform()
  }
}
