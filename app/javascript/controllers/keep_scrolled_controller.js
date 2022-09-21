import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="keep-scrolled"
// Looks for a container class name to use as the item that has an overflow set
// Uses the margin value to give some wiggle room for how high up a user should be from the bottom before the scroll will kick in 
// -1 as the margin value means always scroll

export default class extends Controller {
  static values = {
    container: String,
    margin: Number
  }
  connect() {
    const box = document.getElementsByClassName(this.containerValue)[0];
    const isScrolledToBottom = box.scrollHeight - box.clientHeight <= box.scrollTop + this.marginValue;
    if(isScrolledToBottom || this.marginValue == -1) {
      box.scrollTop = box.scrollHeight - box.clientHeight;
    }
      
  }

}
