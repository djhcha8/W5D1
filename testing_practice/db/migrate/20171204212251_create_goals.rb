class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :body, null: false
      t.integer :user_id, null: false, index: true
      t.boolean :private, null: false
      t.boolean :completed, null: false

      t.timestamps
    end
  end
end
