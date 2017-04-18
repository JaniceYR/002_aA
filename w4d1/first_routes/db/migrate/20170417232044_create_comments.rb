class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :user_id, null: false
      t.integer :artwork_id, null: false
      t.index :user_id
      t.index :artwork_id
    end
  end
end
