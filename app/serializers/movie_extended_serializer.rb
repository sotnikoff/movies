class MovieExtendedSerializer < Grape::Entity
  expose :id
  expose :title
  expose :description
  expose :image
  expose :movie_length
  expose :adult_rating
  expose :rating
  expose :company, using: CompanySerializer
  expose :director, using: DirectorSerializer
  expose :genre, using: GenreSerializer
  expose :release_date
end
