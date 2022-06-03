import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment"
export default class extends Controller {
  revealForm(e) {
    let commentForm = e.srcElement.nextElementSibling
    commentForm.style.display = "block"
  }
  
}
