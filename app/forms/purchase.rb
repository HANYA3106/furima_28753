class Purchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :phone_number, :building_name, :item_id, :user_id, :item_purchase_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{,11}\z/, message: 'is invalid.' }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_purchase_id: item_purchase.id)
  end
end
