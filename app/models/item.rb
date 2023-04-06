class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery_time

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :delivery_time_id
    validates :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_time_id,
              numericality: { other_than: 1, message: "を入力してください" }
  end
    validates :price, presence: true, numericality: { only_integer: true, message: 'は半角数字で入力してください' }

  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'を販売価格範囲内で入力してください' }
end
