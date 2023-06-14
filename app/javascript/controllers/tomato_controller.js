import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["workmin", "workset", "worksec", "brkset", "brkmin", "start", "pause", "mode"]

  connect() {
    console.log("Hello to this timer")
  }

workmin = 25;
brkmin = 5;
let worksec = 0;
let brksec = 0;
let thismin = workmin;
let thissec = worksec;
let mode = "work";
let go;
let startscreen = true;

function screen1() {
$("#outer").hide();
$("#pause").hide();
$("#reset").hide();
$(".timer").hide();
$("#mode").hide();
startscreen = true;
}

function screen2() {
$("#outer").show();
$("#pause").show();
$("#reset").show();
$(".timer").show();
$("#mode").show();
startscreen = false;
}

function addGrn() {
$("#circle").removeClass("red");
$("#circle").removeClass("blue");
$("#circle").addClass("green");
$(".button").removeClass("redbtn");
$(".button").removeClass("blubtn");
$(".button").addClass("grnbtn");
}

function addRed() {
$("#circle").removeClass("green");
$("#circle").removeClass("blue");
$("#circle").addClass("red");
$(".button").removeClass("grnbtn");
$(".button").removeClass("blubtn");
$(".button").addClass("redbtn");
}

function addBlu() {
$("#circle").removeClass("red");
$("#circle").removeClass("green");
$("#circle").addClass("blue");
$(".button").removeClass("grnbtn");
$(".button").removeClass("redbtn");
$(".button").addClass("blubtn");
}

$(document).ready(function () {
screen1();
$("#mode").html(mode);
if (workmin < 10) {
$("#workmin").html("0" + workmin);
} else {
$("#workmin").html(workmin);
}
if (worksec < 10) {
$("#worksec").html("0" + worksec);
} else {
$("#worksec").html(worksec);
}
$("#brkmin").html(brkmin);
$("#workset").html(workmin);
$("#brkset").html(brkmin);
});

let endTime;
let currentTime;
let minsLeft;
let minsLeftConst;

function getTimeVals() {
const d = new Date();
currentTime = d.getTime();
const minMS = thismin * 60000;
const secMS = thissec * 1000;
endTime = currentTime + minMS + secMS;
minsLeft = endTime - currentTime;

if (mode === "work") {
minsLeftConst = workmin * 60000 + worksec * 1000;
} else {
minsLeftConst = brkmin * 60000 + brksec * 1000;
}

document.getElementById("inner").style.width =
100 - (100 * minsLeft) / minsLeftConst + "%";
}

function countdown() {
go = setInterval(timeLeft, 1000);
}


updateTimeLeft() {
  if (this.minsLeft >= 0) {
    this.thismin = Math.floor((this.minsLeft % (1000 * 60 * 60)) / (1000 * 60))
    this.thissec = Math.floor((this.minsLeft % (1000 * 60)) / 1000)

    if (this.thismin < 10) {
      this.workminTarget.innerHTML = `0${this.thismin}`
    } else {
      this.workminTarget.innerHTML = this.thismin
    }

    if (this.thissec < 10) {
      this.worksecTarget.innerHTML = `0${this.thissec}`
    } else {
      this.worksecTarget.innerHTML = this.thissec
    }

    this.innerTarget.style.width = `${100 - (100 * (this.minsLeft / this.minsLeftConst))}%`

    this.minsLeft -= 1000
  } else {
    if (this.mode === "work") {
      this.addGrn()
      this.mode = "break"
      this.thismin = this.brkmin
      this.thissec = this.brksec
      this.getTimeVals()
      this.modeTarget.innerHTML = this.mode

      if (this.thismin < 10) {
        this.workminTarget.innerHTML = `0${this.thismin}`
      } else {
        this.workminTarget.innerHTML = this.thismin
      }

      if (this.thissec < 10) {
        this.worksecTarget.innerHTML = `0${this.thissec}`
      } else {
        this.worksecTarget.innerHTML = this.thissec
      }

      this.minsLeft -= 1000
    } else {
      this.addBlu()
      this.mode = "work"
      this.thismin = this.workmin
      this.thissec = this.worksec
      this.minsLeftConst = this.thismin * 60000
      this.getTimeVals()
      this.modeTarget.innerHTML = this.mode

      if (this.thismin < 10) {
        this.workminTarget.innerHTML = `0${this.thismin}`
      } else {
        this.workminTarget.innerHTML = this.thismin
      }

      if (this.thissec < 10) {
        this.worksecTarget.innerHTML = `0${this.thissec}`
      } else {
        this.worksecTarget.innerHTML = this.thissec
      }

      this.minsLeft -= 1000
    }
  }
}

setEventListeners() {
  this.element.querySelector("#workplus").addEventListener("click", () => {
    this.incrementWorkMin()
  })

  this.element.querySelector("#workminus").addEventListener("click", () => {
    this.decrementWorkMin()
  })

  this.element.querySelector("#brkplus").addEventListener("click", () => {
    this.incrementBreakMin()
  })

  this.element.querySelector("#brkminus").addEventListener("click", () => {
    this.decrementBreakMin()
  })

  this.element.querySelector("#start").addEventListener("click", () => {
    this.startTimer()
    this.hideStartButton()
    this.hideControls()
    this.screen2()
  })

  this.element.querySelector("#pause").addEventListener("click", () => {
    this.pauseTimer()
    this.hidePauseButton()
    this.showStartButton()
  })

  this.element.querySelector("#reset").addEventListener("click", () => {
    this.resetTimer()
    this.showStartButton()
    this.showControls()
    this.screen1()
  })

  this.element.querySelectorAll(".updown").forEach((control) => {
    control.addEventListener("mousedown", (event) => {
      event.preventDefault()
    })
  })
}

incrementWorkMin() {
  this.workmin++
  this.worksec = 0
  this.updateDisplay()
}

decrementWorkMin() {
  if (this.workmin > 1) {
    this.workmin--
    this.worksec = 0
    this.updateDisplay()
  }
}

incrementBreakMin() {
  this.brkmin++
  this.updateDisplay()
}

decrementBreakMin() {
  if (this.brkmin > 1) {
    this.brkmin--
    this.updateDisplay()
  }
}

startTimer() {
  this.getTimeVals()
  this.countdown()
}

pauseTimer() {
  clearInterval(this.timer)
}

resetTimer() {
  this.addRed()
  this.workmin = 25
  this.worksec = 0
  this.thismin = this.workmin
  this.thissec = this.worksec
  this.mode = "work"
  this.updateDisplay()
  clearInterval(this.timer)
}

hideStartButton() {
  this.startTarget.style.display = "none"
}

showStartButton() {
  this.startTarget.style.display = "block"
}

hidePauseButton() {
  this.pauseTarget.style.display = "none"
}

showControls() {
  const controls = this.element.querySelectorAll(".controls")
  controls.forEach((control) => {
    control.style.display = "block"
  })
}

hideControls() {
  const controls = this.element.querySelectorAll(".controls")
  controls.forEach((control) => {
    control.style.display = "none"
  })
}

screen1() {
  // Implement your screen1 logic
}

screen2() {
  // Implement your screen2 logic
}

updateDisplay() {
  this.workminTarget.innerHTML = this.workmin
  this.worksetTarget.innerHTML = this.workmin
  this.worksecTarget.innerHTML = this.worksec < 10 ? `0${this.worksec}` : this.worksec
}

}
