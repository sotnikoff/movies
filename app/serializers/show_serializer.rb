class ShowSerializer < Grape::Entity
  expose :id
  expose :hall_id
  expose :movie_id
  expose :show_time
end
