class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :horse
  
  validates :user_id, uniqueness: { scope: :horse_id }
end