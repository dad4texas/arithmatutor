class User < ApplicationRecord
  has_secure_password
  has_many :problems
  has_many :helped_problems
  has_many :problems_helped, through: :helped_problems, source: 'problem'
  has_many :problem_comments
  validates :username, presence: true
  validates :email, presence: true

  def add_problem(problem)
    if self.problems_helped.where(id: problem.id).empty?
      HelpedProblem.create(user: self, problem: problem)
    end
  end

end
