class OrderDispatchersController < ApplicationController
    def show
        @order_dispatcher = OrderDispatcher.find(params[:id])
        @order_cable = OrderCable.new
      end
end
