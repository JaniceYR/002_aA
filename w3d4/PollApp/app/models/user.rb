class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :responses, class_name: :Response,
            primary_key: :id, foreign_key: :user_id

  has_many :authored_polls, class_name: :Poll,
            primary_key: :id, foreign_key: :author_id
end
