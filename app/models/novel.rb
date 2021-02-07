class Novel < ApplicationRecord
  belongs_to :user

  has_many :likers, through: :likes

  validates :title, presence: true
  validates :user_id, presence: true
end
