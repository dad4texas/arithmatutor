class Problem < ApplicationRecord
  belongs_to :user
  has_many :problem_categories
  has_many :categories, through: :problem_categories
  has_many :helped_problems
  has_many :helped, through: :helped_problems, source: 'user'
  has_many :problem_comments
  validates :name, :description, presence: true
  accepts_nested_attributes_for :categories
  scope :active_problems, -> {where(active: true)}

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attribute[:name].present?
        category = Category.find_or_create_by(category_attribute)
        if !self.categories.include?(category)
          self.categories << category
        end
      end
    end
  end

end
