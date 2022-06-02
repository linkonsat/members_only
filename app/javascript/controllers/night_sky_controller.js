import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="night-sky"
export default class extends Controller {
  connect() {
    let w = window.innerWidth;
    let h = window.innerHeight;
    let i = 1;
    let limit = this.getRndInteger(400, 900);
    
    let starColor = "orange";
    
    while(i < limit) {
      let topPosition = this.getRndInteger(1, h);
      let leftPosition = this.getRndInteger(1, w);
      let scale = this.getRndInteger(1,10) / 10;
      let starRand = this.getRndInteger(1,3);
      if(starRand == 1) { 
        starColor = "yellow"; 
      }
      else if(starRand == 2) { 
        starColor = "lightblue"; 
      }
      else { 
        starColor = "white"; 
      }
      this.starNormal(starColor, topPosition, leftPosition, scale);
      i++;
    }

  }

  getRndInteger(min, max) {
     return Math.floor(Math.random() * (max - min + 1) ) + min;
    }

  starNormal(starColor, topPosition, leftPosition, scale){
    let drawnStar = document.createElement('div');
    drawnStar.setAttribute("id", "normalstar");
    drawnStar.setAttribute("style", "background-color: " + starColor + "; top: " + topPosition + "px; " + 
      "left: " + leftPosition + "px; " + "transform: scale(" + scale + ")");
    document.getElementById("sky").appendChild(drawnStar);
  }


}
