module Api
  class OrdersController < ApiController
    def create_order
      if Order.create(order_params)
        render json: { status: 'created' }
      else
        render json: { status: 'error' }, status: :bad_request
      end
    end

    private

    def order_params
      params.require(:order)
        .permit(:email, :show_id, :phone, reservations_attributes: %i[row seat show_id])
    end
  end
end
