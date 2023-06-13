import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['minutes', 'seconds']

  connect() {
    console.log("Hello to this timer")
  }

  // const bells = new Audio('./sounds/bell.wav');
myInterval;
state = true;

appTimer() {
  const sessionAmount = Number.parseInt(this.minutesTarget.textContent)

  if(this.state) {
    this.state = false;
    let totalSeconds = sessionAmount * 60;

    const updateSeconds = () => {
      console.log("text")
      const minuteDiv = this.minutesTarget
      const secondDiv = this.secondsTarget

      totalSeconds--;

      let minutesLeft = Math.floor(totalSeconds/60);
      let secondsLeft = totalSeconds % 60;

      if(secondsLeft < 10) {
        secondDiv.textContent = '0' + secondsLeft;
      } else {
        secondDiv.textContent = secondsLeft;
      }
      minuteDiv.textContent = `${minutesLeft}`

      if(minutesLeft === 0 && secondsLeft === 0) {
       // bells.play()
        console.log('bells are ringing')
        clearInterval(this.myInterval);
      }
    }

    this.myInterval = setInterval(updateSeconds, 1000);
  } else {
    alert('Session has already started.')
  }
}


}
