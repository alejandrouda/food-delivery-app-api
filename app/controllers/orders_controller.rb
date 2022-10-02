class OrdersController < ApplicationController

    skip_before_action :authenticate_user!

    def index
        @orders = Order.all

        render json:@orders
    end 
end
