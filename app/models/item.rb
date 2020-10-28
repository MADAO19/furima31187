class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :daystoship
  belongs_to_active_hash :deliverycharge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to :user
  has_one_attached :image
  has_one :purchase_after
  

  with_options presence: true do
    validates :name
    validates :description
    validates :category
    validates :daystoship
    validates :deliverycharge
    validates :prefecture
    validates :status
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :daystoship_id
    validates :deliverycharge_id
    validates :prefecture_id
    validates :status_id
  end
end
