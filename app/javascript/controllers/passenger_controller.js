import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "passengerFieldsArea", "passengerField", "fieldTemplate" ]
  static values = {
    passengerCount: Number
  }

  connect() {
    this.passengerCountValue = this.passengerFieldTargets.length
    console.log("Hello from passenger controller")
  }

  addPassenger(){
    console.log("Added new passenger")
  }

  removePassenger(){
    console.log("Removed this passenger")
  }


}
