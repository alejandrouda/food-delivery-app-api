import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["hello"];
  connect() {
    console.log("hey");
    this.element.textContent = "Hello World!";
  }
}
