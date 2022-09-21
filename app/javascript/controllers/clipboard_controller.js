import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static values = { url: String }
  copy() {
    navigator.clipboard.writeText(this.urlValue)
    const flash = document.getElementById('flash')
    flash.innerHTML = '<div class="flash__message">URL Copied to Clipboard</div>'
  }
}
