class ShowSerializer < Grape::Entity
  expose :id
  expose :hall, using: HallSerializer
  expose :show_time
end
