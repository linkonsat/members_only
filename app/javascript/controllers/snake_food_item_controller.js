import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="snake-food-item"
export default class extends Controller {
  static targets = [ "food" ]
  
  setFruit() {
    //first we create the div
    const newDiv = document.createElement("div")
    //then we append it to the board
    this.boardTarget.appendChild(newDiv)
    //then we add styling to set it at the start position
    newDiv.classList.add("fruit")
  }
}
