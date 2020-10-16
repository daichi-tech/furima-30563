class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Association::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :stasus
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :title, length: {maximum: 40 }
    validates :information, length: {maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
    validates :category
    validates :stasus
    validates :delivery_fee
    validates :delivery_date
    validates :prefecture
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :stasus_id
    validates :delivery_fee_id
    validates :delivery_date_id
  end
  validates :prefecture_id, numericality: { other_than: 0 }

end
