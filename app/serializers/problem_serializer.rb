class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :categories, :city, :school
  belongs_to :user
  has_many :problem_comments
end
