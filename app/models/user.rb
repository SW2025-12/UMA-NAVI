class User < ApplicationRecord

  has_many :favorites, dependent: :destroy
  has_many :favorite_horses, through: :favorites, source: :horse
  has_many :comments, dependent: :destroy
end