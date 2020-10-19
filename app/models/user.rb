class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
validates :nickname, presence: true
validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
validates :name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
validates :last_name_kana, presence: true, format: {
  with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
}
validates :name_kana, presence: true, format: {
  with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
}
validates :birthday, presence: true
end
