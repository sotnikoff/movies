module Api
  class OrdersController < ApiController
    def create_order
      if CreateOrder.call(order_params)
        render json: { status: 'created' }
      end
    end

    private

    def order_params
      params.require(:order)
        .permit(:email, :show_id, :phone, ordered_seats: %i[row seat])
    end
  end
end
