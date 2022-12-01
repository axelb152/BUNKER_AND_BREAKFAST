import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = ["start_date", "end_date"]

  connect() {
    flatpickr(this.start_dateTarget, {})
    flatpickr(this.end_dateTarget, {})
  }
}
