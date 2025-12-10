class Horse < ApplicationRecord
  has_many :entries
  has_many :races, through: :entries
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :comments, dependent: :destroy

  scope :search_by_name, ->(keyword) { where("name LIKE ?", "%#{keyword}%") if keyword.present? }
end