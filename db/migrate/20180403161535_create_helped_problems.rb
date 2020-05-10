class CreateHelpedProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :helped_problems do |t|
      t.integer :user_id
      t.integer :problem_id

      t.timestamps
    end
  end
end
