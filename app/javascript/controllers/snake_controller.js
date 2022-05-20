import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="snake"
export default class extends Controller {
  static targets = [ "board", "player", "enemy" ]
  
  clearBoard() {
    while (this.boardTarget.firstChild) {
      this.boardTarget.removeChild(this.boardTarget.firstChild);
    }
    this.setBoard()
  }

  setBoard() {
    const newDiv = document.createElement("div")
    this.boardTarget.appendChild(newDiv)
    newDiv.classList.add("start_position")
    const fruitDiv = document.createElement("div")
    this.boardTarget.appendChild(fruitDiv)
    fruitDiv.classList.add("fruit")
  }

  startGame() {
    setInterval(() => this.startRound(), 1000);
  }

  startRound(event, nextCount = 9) {
    this.moveLeft()
    document.addEventListener('keydown', this.changePath.bind(this));
  }

  changePath(event) {
   this.clearIntervals()
     if (event.key === "w") { 
          this.moveUp(event);

     } else if (event.key === "s") { 
          this.moveDown(event);

      } else if (event.key === "a") { 
          this.moveLeft(event);

      } else if (event.key === "d") { 
         this.moveRight(event);

     };
  };

  generateEnemy() {
    let spot = this.emptyBoardSpot()
    const fruitDiv = document.createElement("div")
    this.boardTarget.appendChild(fruitDiv)
    fruitDiv.classList.add("fruit")
    fruitDiv.dataset.snakeTarget = "enemy"
    fruitDiv.style.gridColumn = `${spot[0]}`
    fruitDiv.style.gridRow = `${spot[1]}`    
  }

  getPlayerColumn() {
    let playerProperty = window.getComputedStyle(this.playerTarget)
    return playerProperty.getPropertyValue('grid-column').replace(/\D/g, "");
  }

  getPlayerRow() {
    let playerProperty = window.getComputedStyle(this.playerTarget)
    return playerProperty.getPropertyValue('grid-row').replace(/\D/g, "");
  }

  moveUp() {
    this.clearIntervals()
    if(this.playerTargets.length != 1) {
      this.moveTail()
      } 
    this.playerTargets[0].style.gridRow = `${Number(this.getPlayerRow()) - 1}`;
    setInterval(() => this.moveUp(), 1000);
    this.foundEnemy();
  };

  moveDown() {
    this.clearIntervals()
    if(this.playerTargets.length != 1) {
      this.moveTail()
      } 
    this.playerTargets[0].style.gridRow = `${Number(this.getPlayerRow()) + 1}`;
    setInterval(() => this.moveDown(), 1000);
    this.foundEnemy();
  };

  moveRight() {
    this.clearIntervals()
    if(this.playerTargets.length != 1) {
      this.moveTail()
      } 
    this.playerTargets[0].style.gridColumn = `${Number(this.getPlayerColumn()) + 1}`;
    setInterval(() => this.moveRight(), 1000);
    this.foundEnemy();
  };

  moveLeft() {
    this.clearIntervals()
    if(this.playerTargets.length != 1) {
      this.moveTail()
      } 
    this.playerTargets[0].style.gridColumn = `${Number(this.getPlayerColumn()) - 1}`;
    setInterval(() => this.moveLeft(), 1000);
    this.foundEnemy();
  };

  bodyValues() {
    let values = []
    for (let i = 0; i < this.playerTargets.length; i++) {
      let playerProperty = window.getComputedStyle(this.playerTargets[i])
      let tailColumn = playerProperty.getPropertyValue('grid-column').replace(/\D/g, "");
      let tailRow = playerProperty.getPropertyValue('grid-row').replace(/\D/g, "");
      values.push([Number(tailColumn),Number(tailRow)])
    }
    return values
  };

  emptyBoardSpot() {
    //first we know we need a loop
    let boardSpot = [this.getRandomInt(11),this.getRandomInt(11)]
    let positions = this.bodyValues()
    while(positions.includes(boardSpot)) {
      boardSpot = [this.getRandomInt(11),this.getRandomInt(11)]
    }
    return boardSpot
  }

  getRandomInt(max) {
    return Math.floor(Math.random() * max);
  }

  moveTail() {
    let positions = this.bodyValues()
      for (let i = 1; i < this.playerTargets.length; i++) {
      let targetPosition = positions[i - 1]
      this.playerTargets[i].style.gridColumn = `${targetPosition[0]}`
      this.playerTargets[i].style.gridRow = `${targetPosition[1]}`    
    }
  }

  foundEnemy() {
    if(this.equalCoordinates()){
      this.addTail()
      this.generateEnemy()
    }
  }

  equalCoordinates() {
    let enemyCoordinates = this.enemyCoordinates()
    let playerHeadCoordinates = [this.getPlayerRow(), this.getPlayerColumn()]
    for (let i = 0; i < 2; i++) {
      if(enemyCoordinates[i] != playerHeadCoordinates[i]){ 
      return false 
      }
    } 
    return true
  }

  enemyCoordinates() {
    let enemy = window.getComputedStyle(this.enemyTarget) 
    console.log(this.enemyTarget)
    return [enemy.getPropertyValue('grid-row').replace(/\D/g, ""),enemy.getPropertyValue('grid-column').replace(/\D/g, "")]
  }

  addTail() {
    const newDiv = document.createElement("div")
    newDiv.dataset.snakeTarget = "player"
    newDiv.style.gridColumn = `${Number(this.getPlayerColumn()) + 1}`
    newDiv.style.gridRow = `${Number(this.getPlayerRow())}`
    newDiv.classList.add("snake_tail")
    this.enemyTarget.remove()
    this.boardTarget.appendChild(newDiv)
  }

  clearIntervals() {
    for (let i = 1; i < 1000; i++) {
      clearInterval(i);
  }
  }

}
