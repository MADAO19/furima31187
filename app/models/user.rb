class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :last_name
      validates :name
    end

    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do
      validates :last_name_kana
      validates :name_kana
    end
  end
end
