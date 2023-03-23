class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_time_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
