class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_1_id
      t.integer :user_2_id
      t.text :content
      t.timestamps null: false
    end
  end
end
