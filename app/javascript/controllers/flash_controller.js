import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['flash']

  removeText() {
    console.log(this.flashTarget)
    this.flashTarget.style.display = "none"
  }
}
