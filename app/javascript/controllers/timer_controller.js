import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['minutes', 'seconds', 'minutesB', 'secondsB', 'profiles', 'workminutes', 'breakminutes', 'form', 'time']

  connect() {
    console.log("Hello to this timer")
    console.log(this.minutesBTarget)
      // Download ring tone
      // const bells = new Audio('./sounds/bell.wav');
  }

  // First ask user for minutes and hide timer, then switch
  submitForm(event) {
    event.preventDefault();
    // Hide the form
    this.formTarget.classList.add("d-none");
    // Show the time background
    this.timeTarget.classList.remove("d-none");
    console.log(this.timeTarget)
  }

    myInterval; // used to store intervall ID for timer
    state = true; // flag to track whether the timer is currently running or not
    trigger = false;
    storeTime = this.minutesTarget.textContent

    minuteDiv = this.minutesTarget.textContent
    secondDiv = this.secondsTarget

  // same for breaker
    myIntervalB; // used to store intervall ID for breaker
    stateB = true; // flag to track whether the breaker is currently running or not
    triggerB = false;
    storeTimeB = this.minutesBTarget.textContent

    minuteDivB = this.minutesBTarget.textContent
    secondDivB = this.secondsBTarget

  setMinutes(event) {
    event.preventDefault()
    this.minutesTarget.innerHTML = this.workminutesTarget.value
    this.minutesBTarget.innerHTML = this.breakminutesTarget.value
  }

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


        if(secondsLeft < 10) { // only for adding a 0 such that 09 instead of 9
          secondDiv.textContent = '0' + secondsLeft;
        } else {
          secondDiv.textContent = secondsLeft;
        }
        minuteDiv.textContent = `${minutesLeft}`

        if(minutesLeft === 0 && secondsLeft === 0) {
        // bells.play()
          console.log('bells are ringing')
          // update the profiles table with the storeTime

          // clear the interval
          clearInterval(this.myInterval);

        }
      }

      this.myInterval = setInterval(updateSeconds, 1000);
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

  stopTimer() {
    console.log('timer is stopped')
    clearInterval(this.myInterval);
    this.state = true;
    let secondspast = Number.parseInt(this.storeTime)*60 - Number.parseInt(this.minutesTarget.innerText)*60 - Number.parseInt(this.secondsTarget.innerText)
    fetch(`http://localhost:3000/update_study_time?time=${secondspast}`
    //, { headers: { 'Accept': 'text/plain' } }
    ).then(response => response.text()).then(data => console.log(data))

    // calculate the working time for storing as difference between original time and left time
    // how to deal with seconds?

    console.log('timer should be reset now')
    // Reset it to original time, a small notification would be nice
    this.minutesTarget.innerText = this.storeTime
    this.secondsTarget.innerText = ' 00'
    }




////////////////////////// BREAK TIMER

  appBreak() {
  // sessionAmount is assigned the value of the 'minutes' target's text content
    let sessionAmountB = " "


    const minuteDivB = this.minutesBTarget
    const secondDivB = this.secondsBTarget

    sessionAmountB = Number.parseInt(this.minutesBTarget.textContent)

    let totalSecondsB = sessionAmountB * 60; // to calculate the total seconds

    if(this.triggerB) {
      totalSecondsB = Number.parseInt(minuteDivB.textContent)*60 + Number.parseInt(secondDivB.textContent);
    }


    if(this.stateB) {
      this.stateB = false; // if session is not running, then proceed timer logic


      const updateSecondsB = () => { // is responsible for updating the timer display every second
        console.log("break runs")


        totalSecondsB--; // value is reduced by one


        let minutesLeftB = Math.floor(totalSecondsB/60); // current minutes
        let secondsLeftB = totalSecondsB % 60;  // current seconds
        console.log(minutesLeftB, secondsLeftB)

        if(secondsLeftB < 10) {
          secondDivB.textContent = '0' + secondsLeftB;
        } else {
          secondDivB.textContent = secondsLeftB;
        }
        minuteDivB.textContent = `${minutesLeftB}`

        if(minutesLeftB === 0 && secondsLeftB === 0) {
        // bells.play()
          console.log('bells are ringing')
          clearInterval(this.myIntervalB);
          // calculate total working time
        }
      }

      this.myIntervalB = setInterval(updateSecondsB, 1000);
    }
  }

  pauseBreak() {
    console.log('break is paused')
    clearInterval(this.myIntervalB);
    // function must be aborted
    this.stateB = true;
    this.triggerB = true;
  }

  stopBreak() {
    console.log('break is stopped')
    clearInterval(this.myIntervalB);
    this.stateB = true;
    let secondspastB = Number.parseInt(this.storeTimeB)*60 - Number.parseInt(this.minutesBTarget.innerText)*60 - Number.parseInt(this.secondsBTarget.innerText)
    fetch(`http://localhost:3000/update_break_time?time=${secondspastB}`
    //, { headers: { 'Accept': 'text/plain' } }
    ).then(response => response.text()).then(data => console.log(data))

    console.log('break should be reset now')
    // Reset it to original time, a small notification would be nice
    this.minutesBTarget.innerText = this.storeTimeB
    this.secondsBTarget.innerText = ' 00'
  }
}
