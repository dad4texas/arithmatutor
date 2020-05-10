class CreateProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :problems do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :city
      t.string :state
      t.integer :user_id

      t.timestamps
    end
  end
end
