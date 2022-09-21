class OrderCablesController < ApplicationController
    def create
        @order_dispatcher = OrderDispatcher.find(params[:order_dispatcher_id])
        @order_cable = OrderCable.new(order_cable_params)
        @order_cable.order_dispatcher = @order_dispatcher
        @order_cable.user = current_user
        if @order_cable.save
            OrderDispatcherChannel.broadcast_to(
              @order_dispatcher,
              render_to_string(partial: "order_cable", locals: {order_cable: @order_cable})
            )
            head :ok
          else
          render "order_dispatchers/show", status: :unprocessable_entity
        end
      end
    
      private
    
      def order_cable_params
        params.require(:order_cable).permit(:content)
      end
end
