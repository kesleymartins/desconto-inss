import { Controller } from "@hotwired/stimulus"
import { formatGeneral } from 'cleave-zen'

export default class extends Controller {
  cpf() {
    this.element.value = formatGeneral(this.element.value, {
      blocks: [3, 3, 3, 2],
      delimiters: ['.', '.', '-'],
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
      blocks: [0, 2, 5, 4],
      delimiters: ['(', ') ', '-'],
      numericOnly: true
    })
  }

  money() {
    this.element.value = this.element.value.replaceAll(/[^0-9]/g, '')

    while(this.element.value.length < 3) {
      this.element.value = '0' + this.element.value
    }

    if (this.element.value.length > 3 && this.element.value[0] === '0') {
      this.element.value = this.element.value.substring(1)
    }

    const cents = this.element.value.slice(-2)
    const number = this.element.value.slice(0, -2)

    this.element.value = `${number}.${cents}`
  }
}
