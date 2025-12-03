class Horse < ApplicationRecord
  # 馬データに画像を添付できるようにする (ActiveStorage)
  has_one_attached :image
  
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user
  has_many :race_results, dependent: :destroy

  # 検索対象のカラムを定義 (Ransack用)
  def self.ransackable_attributes(auth_object = nil)
    ["name", "sire", "dam"]
  end
end