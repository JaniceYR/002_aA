class Like < ActiveRecord::Base

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  belongs_to :likable, polymorphic: true

end
