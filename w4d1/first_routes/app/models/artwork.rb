class Artwork < ActiveRecord::Base
  validates :title, :image_url, :artist_id, presence: true
  validates_uniqueness_of :title, scope: :artist_id

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'User'

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: 'ArtworkShare'

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :comments, :dependent => :destroy

  has_many :likes, as: :likable

  has_many :liking_users, through: :likes, source: :user

end
