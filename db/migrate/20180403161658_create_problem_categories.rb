class CreateProblemCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :problem_categories do |t|
      t.integer :category_id
      t.integer :problem_id

      t.timestamps
    end
  end
end
