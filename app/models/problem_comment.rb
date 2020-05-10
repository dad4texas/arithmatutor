class ProblemComment < ApplicationRecord
  belongs_to :user
  belongs_to :problem
  validates :comment, presence: true

end
