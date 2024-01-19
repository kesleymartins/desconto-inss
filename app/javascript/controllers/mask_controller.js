import { Controller } from "@hotwired/stimulus"
import { formatGeneral } from 'cleave-zen'

export default class extends Controller {
  cpf() {
    this.element.value = formatGeneral(this.element.value, {
      blocks: [3, 3, 3, 2],
      delimiters: ['-', '-', '-'],
      numericOnly: true
    })
  }

  zipCode() {
    this.element.value = formatGeneral(this.element.value, {
      blocks: [5, 3],
      delimiter: '-',
      numericOnly: true
    })
  }

  phoneNumber() {
    this.element.value = formatGeneral(this.element.value, {
      blocks: [0, 2, 1, 4, 4],
      delimiters: ['(', ') ', ' ', '-'],
      numericOnly: true
    })
  }
}
