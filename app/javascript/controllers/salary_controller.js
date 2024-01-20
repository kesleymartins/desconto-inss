import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="salary"
export default class extends Controller {
  static targets = [ 'salaryInput', 'discountInput' ]

  async getDiscount() {
    const salary = this.salaryInputTarget.value
    const url = `${location.origin}/salaries/calculate-discount?salary=${salary}`

    const response = await fetch(url, {
      mode: 'same-origin'
    })

    const data = await response.json()

    this.discountInputTarget.value = data.discount
  }
}
