import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="snake"
export default class extends Controller {
  static targets = [ "board", "player", "enemy" ]
  
  addScore() {
    let score = document.getElementById("score")
    score.textContent++
  }

  resetScore() {
    let score = document.getElementById("score")
    score.textContent = 1
  }
  clearBoard() {
    while (this.boardTarget.firstChild) {
      this.boardTarget.removeChild(this.boardTarget.firstChild);
    }
    document.removeEventListener('keydown', this.boundChangePath)
    this.setBoard()
  }

  setBoard() {
    const newDiv = document.createElement("div")
    this.boardTarget.appendChild(newDiv)
    newDiv.classList.add("start_position")
    newDiv.dataset.snakeTarget = "player"
    const fruitDiv = document.createElement("div")
    this.boardTarget.appendChild(fruitDiv)
    fruitDiv.classList.add("fruit")
    fruitDiv.dataset.snakeTarget = "enemy"
    this.clearIntervals()
  }

  startGame() {
    setInterval(() => this.startRound(), 1000);
  }

  startRound(event, nextCount = 9) {
    this.moveLeft()
    this.boundChangePath = this.changePath.bind(this)
    document.addEventListener('keydown', this.boundChangePath);
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

     if(this.lose()) {
      this.addHighScore()
      this.clearBoard()
      this.setBoard()
      this.resetScore()
      alert("You lost! go ahead and try and score even higher!")
    }
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

  lose() {
    let result = []
    let body = this.bodyValues()
    let playerPosition = [this.getPlayerColumn(), this.getPlayerRow()]
    body.forEach((element) => {
      if(element[0] == playerPosition[0] && element[1] == Number(playerPosition[1]) + 1) {
        result.push(true)
      }

      if(element[0] == playerPosition[0] && element[1] == Number(playerPosition[1]) - 1){
        result.push(true)
      }

      if(element[0] == Number(playerPosition[0]) + 1 && element[1] == playerPosition[1]) {
        result.push(true)
      }

      if(element[0] == Number(playerPosition[0]) - 1 && element[1] == playerPosition[1]) {
        result.push(true)
      }
    });

    if(result.length == 4) {
      return true
    } else {
      return false
    }
  }

  getPlayerColumn() {
    let playerProperty = window.getComputedStyle(this.playerTargets[0])
    return playerProperty.getPropertyValue('grid-column').replace(/\D/g, "");
  }

  getPlayerRow() {
    let playerProperty = window.getComputedStyle(this.playerTargets[0])
    return playerProperty.getPropertyValue('grid-row').replace(/\D/g, "");
  }

  allyPiece(position) {
    let allyPiece = true 
    let allyPieces = this.bodyValues()
    allyPieces.forEach((element) => {
      if(element[0] == position[0] && element[1] == position[1]){
        allyPiece = false 
      }
    });
    return allyPiece
  }
 
  moveUp() {
    if(this.allyPiece([Number(this.getPlayerColumn()),Number(this.getPlayerRow()) - 1])){ 
      this.clearIntervals()
    if(this.playerTargets.length != 1) {
      this.moveTail()
      } 
    this.playerTargets[0].style.gridRow = `${Number(this.getPlayerRow()) - 1}`;
    setInterval(() => this.moveUp(), 1000);
    this.foundEnemy();
    }
  };

  moveDown() {
    if(this.allyPiece([Number(this.getPlayerColumn()),Number(this.getPlayerRow()) + 1])){ 
    this.clearIntervals()
    if(this.playerTargets.length != 1) {
      this.moveTail()
      } 
      if(Number(this.getPlayerRow()) < 10) {
    this.playerTargets[0].style.gridRow = `${Number(this.getPlayerRow()) + 1}`;
    setInterval(() => this.moveDown(), 1000);
    this.foundEnemy();
      }
    }
  };

  moveRight() {
    if(this.allyPiece([Number(this.getPlayerColumn()) + 1,Number(this.getPlayerRow())])){ 
    this.clearIntervals()
    if(this.playerTargets.length != 1) {
      this.moveTail()
      } 
      if(Number(this.getPlayerColumn()) < 10) {
    this.playerTargets[0].style.gridColumn = `${Number(this.getPlayerColumn()) + 1}`;
    setInterval(() => this.moveRight(), 1000);
    this.foundEnemy();
      }
    }
  };

  moveLeft() {
    if(this.allyPiece([Number(this.getPlayerColumn()) - 1,Number(this.getPlayerRow())])){ 
    this.clearIntervals()
    if(this.playerTargets.length != 1) {
      this.moveTail()
      } 
    this.playerTargets[0].style.gridColumn = `${Number(this.getPlayerColumn()) - 1}`;
    setInterval(() => this.moveLeft(), 1000);
    this.foundEnemy();
    }
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
    let boardSpot = [this.getRandomInt(11),this.getRandomInt(11)]
    let positions = this.bodyValues()
    let potentialSpots = true
    while(potentialSpots) {
      positions.forEach((element) => {
      if(Number(element[0]) != boardSpot[0] && Number(element[1]) != boardSpot[1]){
        potentialSpots = false
      }  else {
        boardSpot = [this.getRandomInt(11),this.getRandomInt(11)]
        potentialSpots = true
      }
    })
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
      this.addScore()
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
    return [enemy.getPropertyValue('grid-row').replace(/\D/g, ""),enemy.getPropertyValue('grid-column').replace(/\D/g, "")]
  }

  addTail() {
    const newDiv = document.createElement("div")
    newDiv.dataset.snakeTarget = "player"
    let targetElement = window.getComputedStyle(this.playerTargets[this.playerTargets.length - 1])
    newDiv.style.gridColumn = `${targetElement.getPropertyValue('grid-column')}`
    newDiv.style.gridRow = `${targetElement.getPropertyValue('grid-row')}`
    newDiv.classList.add("snake_tail")
    this.enemyTarget.remove()
    this.boardTarget.appendChild(newDiv)
  }

  clearIntervals() {
    for (let i = 1; i < 1000; i++) {
      clearInterval(i);
  }
  }

  addHighScore() {
    let score = document.getElementById('high_score')
    let currentScore = document.getElementById("score")
    if(Number(currentScore.textContent) > Number(score.textContent)) {
      score.textContent = `${Number(currentScore.textContent)}`
    }
  }

}
