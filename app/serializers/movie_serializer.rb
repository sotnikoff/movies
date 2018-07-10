class MovieSerializer < Grape::Entity
  expose :id
  expose :title
  expose :description
  expose :image
  expose :release_date
  expose :adult_rating
  expose :rating
end
