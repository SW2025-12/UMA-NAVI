class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザーはお気に入りの馬をたくさん持つ
  has_many :favorites, dependent: :destroy
  has_many :favorite_horses, through: :favorites, source: :horse
end