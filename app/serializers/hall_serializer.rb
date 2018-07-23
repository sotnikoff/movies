class HallSerializer < Grape::Entity
  expose :id
  expose :title
  expose :description
  expose :size do
  	expose :rows
  	expose :seats
  end
end
