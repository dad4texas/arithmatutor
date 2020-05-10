class ProblemComment < ActiveRecord::Migration[5.1]
  def change
    create_table :problem_comments do |t|
      t.integer :problem_id
      t.integer :user_id
      t.text :comment
    end
  end
end
