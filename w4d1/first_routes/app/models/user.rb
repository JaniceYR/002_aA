class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'Artwork'

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: 'ArtworkShare'

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

  has_many :comments, :dependent => :destroy

  has_many :likes

  has_many :liked_things, through: :likes, source: :likable
end
