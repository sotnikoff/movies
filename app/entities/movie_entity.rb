class MovieEntity < Grape::Entity
  expose :id
  expose :title
  expose :description
  expose :image
  expose :company, using: CompanyEntity
  expose :director, using: DirectorEntity
end
