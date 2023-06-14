import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['minutes', 'seconds']

  connect() {
    console.log("Hello to this timer")
    console.log("Hello Hello")
  }

  // Download ring tone
  // const bells = new Audio('./sounds/bell.wav');
  myInterval; // used to store intervall ID for timer
  state = true; // flag to track whether the timer is currently running or not
  trigger = false;
// define method 'appTimer'
appTimer() {
  // sessionAmount is assigned the value of the 'minutes' target's text content
  let sessionAmount = " "


  const minuteDiv = this.minutesTarget
  const secondDiv = this.secondsTarget

  sessionAmount = Number.parseInt(this.minutesTarget.textContent)
  let totalSeconds = sessionAmount * 60; // to calculate the total seconds

  if(this.trigger) {
    totalSeconds = Number.parseInt(minuteDiv.textContent)*60 + Number.parseInt(secondDiv.textContent);
  }


  if(this.state) {
    this.state = false; // if session is not running, then proceed timer logic


    const updateSeconds = () => { // is responsible for updating the timer display every second
      console.log("timer runs")

      totalSeconds--; // value is reduced by one

      let minutesLeft = Math.floor(totalSeconds/60); // current minutes
      let secondsLeft = totalSeconds % 60;  // current seconds


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

  pauseTimer() {
    console.log('timer is paused')
    clearInterval(this.myInterval);
    // function must be aborted
    this.state = true;
    this.trigger = true;

    // Reset the timer display to initial values
  //   const initialMinutes = Number.parseInt(this.minutesTarget.textContent)
  //   const initialSeconds = Number.parseInt(this. )

  // // Reset the state to allow starting the timer again
  //   this.state = true;
  }
}
