class Novel < ApplicationRecord
  belongs_to :user

  has_many :likers, class_name: "Favorite",
                    foreign_key: "liked_id",
                    dependent: :destroy

  has_many :likes, through: :likers, source: :liker

  validates :title, presence: true
  validates :user_id, presence: true
end
