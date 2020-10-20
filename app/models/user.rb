class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

with_options presence: true do
  validates :nickname
  validates :birthday


with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
  validates :last_name
  validates :name
  

with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/} do
  validates :last_name_kana
  validates :name_kana,
  end
  end
  end
  
  



