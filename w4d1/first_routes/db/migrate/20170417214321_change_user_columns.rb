class ChangeUserColumns < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :name, :email
      t.string :username, null: false
      t.index :username, unique: true
    end

  end
end
