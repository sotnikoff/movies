class ShowExtendedSerializer < Grape::Entity
  expose :id
  expose :hall, using: HallSerializer
  expose :movie, using: MovieSerializer
  expose :show do
  	expose :show_time
  end
  expose :reservations, using: ReservationSerializer
end
