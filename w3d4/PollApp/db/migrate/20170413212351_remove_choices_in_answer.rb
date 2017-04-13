class RemoveChoicesInAnswer < ActiveRecord::Migration[5.0]
  def change
    remove_column :answer_choices, :choices
  end
end
