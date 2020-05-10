class ProblemCommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :problem_id, :comment
  belongs_to :user
  belongs_to :problem
end
