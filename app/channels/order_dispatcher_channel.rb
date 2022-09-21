class OrderDispatcherChannel < ApplicationCable::Channel

    def subscribed
      order_dispatcher = OrderDispatcher.find(params[:id])
      stream_for order_dispatcher
    end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
