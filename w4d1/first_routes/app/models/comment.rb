class Comment < ActiveRecord::Base
  validates :user_id, :artwork_id, :body, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: 'Artwork'

  has_many :likes, as: :likable

  has_many :liking_users, through: :likes, source: :user

end
