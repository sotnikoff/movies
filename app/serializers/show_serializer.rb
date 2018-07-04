class ShowSerializer < Grape::Entity
  expose :id
  expose :movie, using: MovieSerializer
  expose :hall, using: HallSerializer
  expose :show_time
end
