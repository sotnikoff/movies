module Api
  class OrdersController < ApiController
    def create_order
      order = Order.new(order_params)
      if order.save(order_params)
        render json: { status: 'created', id: order.id }
      else
        render json: { status: 'error' }, status: :bad_request
      end
    end

    private

    def order_params
      params.require(:order)
        .permit(:email, :name, :show_id, :phone, reservations_attributes: %i[row seat show_id])
    end
  end
end
