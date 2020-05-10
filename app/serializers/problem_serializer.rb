class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :categories, :city, :state
  belongs_to :user
  has_many :problem_comments
end
