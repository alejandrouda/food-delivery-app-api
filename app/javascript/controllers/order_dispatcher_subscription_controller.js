// app/javascript/controllers/order_dispatcher_subscription_controller.js
import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  static values = { orderDispatcherId: Number };
  static targets = ["ordercables"];

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "OrderDispatcherChannel", id: this.orderDispatcherIdValue },
      {
        received: (data) => this.#insertMessageAndScrollDown(data),
      }
    );

    console.log(
      `Subscribe to the order_dispatcher with the id ${this.orderDispatcherIdValue}.`
    );
  }
  #insertMessageAndScrollDown(data) {
    this.ordercablesTarget.insertAdjacentHTML("beforeend", data);
    this.ordercablesTarget.scrollTo(0, this.ordercablesTarget.scrollHeight);
  }
  resetForm(event) {
    event.target.reset();
  }
}
