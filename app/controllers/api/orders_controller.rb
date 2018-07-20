module Api
  class OrdersController < ApiController
    def create_order
      CreateOrder.call(order_params)
    end

    private

    def order_params
      params.require(:order)
        .permit(:email, :show_id, :phone, ordered_seats: %i[row seat selected reserved])
    end
  end
end
