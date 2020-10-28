class Connect
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipal_district, :address, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id
    validates :municipal_district
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    @connect = PurchaseAfter.create(item_id: item_id, user_id: user_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, municipal_district: municipal_district, address: address, building_name: building_name, phone_number: phone_number, purchase_after_id: @connect.id)
  end
end
