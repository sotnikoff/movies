module CreateOrder
  extend self

  def call(params)
    Order.transaction do
      order = Order.create(email: params[:email], phone: params[:phone])
      params[:ordered_seats].each do |seat|
        res_params = {
          order: order, show_id: params[:show_id],
          row: seat[:row], seat: seat[:seat]
        }
        save_reservation(res_params)
      end
    end
  end

  def save_reservation(params)
    reservation = Reservation.new(params)
    if reservation.valid?
      reservation.save
    else
      raise(ActiveRecord::Rollback)
    end
  end
end
