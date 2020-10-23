class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, uniqueness: true
         validates :password, confirmation: true, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{6,32}+\z/i}       
  with_options presence: true do
         PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
         PASSWORD_REGEX_2 = /\A[ァ-ヶー]+\z/
         validates :password_confirmation
         validates :nickname, length: { maximum: 40 }
         validates :first_name, format: { with: PASSWORD_REGEX}
         validates :last_name, format: { with: PASSWORD_REGEX}
         validates :first_name_kana, format: { with: PASSWORD_REGEX_2}
         validates :last_name_kana, format: { with: PASSWORD_REGEX_2}
         validates :birthday
  end
  has_many :items
  has_many :orders
end
