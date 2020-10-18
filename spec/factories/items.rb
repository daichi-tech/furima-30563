FactoryBot.define do
  factory :item do
    title { "島" }
    information { "無人島" }
    category_id { "2" }
    status_id { "2" }
    delivery_fee_id { "2" }
    delivery_date_id { "2" }
    prefecture_id { "2" }
    price { "2000" }
    association :user

    after(:build) do |photo|
      photo.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
