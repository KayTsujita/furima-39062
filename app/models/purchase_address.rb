class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode,          format: { with: /\A\d{3}-\d{4}\z/, message: 'を正しく入力してください ( 例）123-4567)' }
    validates :prefecture_id,     numericality: { other_than: 1, message: "を入力してください" }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'を正しく入力してください' }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building,
                   phone: phone, purchase_id: purchase.id)
  end
end
