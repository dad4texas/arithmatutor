class Category < ApplicationRecord
  has_many :problem_categories
  has_many :problems, through: :problem_categories

end
