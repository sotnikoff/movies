class ShowExtendedSerializer < Grape::Entity
  expose :hall, using: HallSerializer
  expose :movie, using: MovieSerializer
  expose :show do
    expose :id
    expose :show_time
  end
  expose :reservations, using: ReservationSerializer
end
