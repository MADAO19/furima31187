class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :daystoship
  belongs_to_active_hash :deliverycharge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :daystoship, presence: true
  validates :deliverycharge, presence: true
  validates :prefecture, presence: true
  validates :status, presence: true
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :daystoship_id, numericality: { other_than: 1 }
  validates :deliverycharge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
end
