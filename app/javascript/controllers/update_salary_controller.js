import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-salary"
export default class extends Controller {
  static targets = ["form", "trigger"]

  toggle() {
    this.formTarget.classList.toggle('d-none')
    this.triggerTarget.classList.toggle('d-none')
  }
}
