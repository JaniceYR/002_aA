class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.references :likable, polymorphic: true, index: true
      # t.string :liked_type, null: false

      t.index :user_id
      t.timestamps
    end
  end
end
