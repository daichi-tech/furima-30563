class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, uniqueness: true
         validates :password, format: { with: /[a-z\d]{6,}/i}
         validates :nickname, presence: true, length: { maximum: 40 }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/}
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/}
         validates :birthday, presence: true
end