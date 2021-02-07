class Novel < ApplicationRecord
  belongs_to :User

  validates :title, presence: true
  validates :user_id, presence: true
end
