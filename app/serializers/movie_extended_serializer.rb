class MovieExtendedSerializer < Grape::Entity
  expose :id
  expose :title
  expose :description
  expose :image
  expose :company, using: CompanySerializer
  expose :director, using: DirectorSerializer
  expose :genre, using: GenreSerializer
  expose :release_date
  expose :shows, using: ShowSerializer
end
