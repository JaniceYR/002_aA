class AddUserIdReq < ActiveRecord::Migration
  def change
    add_column :cat_rental_requests, :user_id,
  end
end
