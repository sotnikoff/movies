class CompanySerializer < Grape::Entity
  expose :id
  expose :title
  expose :description
end
