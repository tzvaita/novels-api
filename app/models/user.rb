class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :novels, dependent: :destroy
  has_many :likes, class_name: "Favorite",
                    foreign_key: "liker_id",
                    dependent: :destroy
  has_many :liking, through: :likes, source: :liked
end
