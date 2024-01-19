import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "passengerFieldsArea", "passengerField", "fieldTemplate" ]
  static values = {
    passengerCount: Number
  }

  connect() {
    this.passengerCountValue = this.passengerFieldTargets.length;
  }

  addPassenger(){
    const nextPassengerIndex = this.passengerCountValue
    const nameLabelForAndInputId = `booking_passengers_attributes_${nextPassengerIndex}_name`
    const nameInputName = `booking[passengers_attributes][${nextPassengerIndex}][name]`    
    const emailLabelForAndInputId = `booking_passengers_attributes_${nextPassengerIndex}_email`
    const emailInputName = `booking[passengers_attributes][${nextPassengerIndex}][email]`

    let newFieldFragment = this.fieldTemplateTarget.content.cloneNode(true);
    let nameFieldArea = newFieldFragment.children[0].children[0]
    let emailFieldArea = newFieldFragment.children[0].children[1]

    this.#setFieldAreaAttributes(nameFieldArea, nameLabelForAndInputId, nameInputName)    
    this.#setFieldAreaAttributes(emailFieldArea, emailLabelForAndInputId, emailInputName)    

    this.passengerCountValue++
    this.passengerFieldsAreaTarget.appendChild(newFieldFragment)
  }

  removePassenger(event){
    if (this.passengerFieldsAreaTarget.children.length > 1){
      event.target.parentNode.remove();
    }
  }

  #setFieldAreaAttributes(fieldArea, labelForAndInputId, inputName){
    fieldArea.children[0].setAttribute('for', labelForAndInputId)
    fieldArea.children[1].setAttribute('id', labelForAndInputId)
    fieldArea.children[1].setAttribute('name', inputName)
  }
}
