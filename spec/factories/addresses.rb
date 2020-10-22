FactoryBot.define do
  factory :address do
    postal_code { "123-4567" }
    city { "千葉市" }
    house_number { "1-1" }
    building { "ビル" }
    phone_number { "11122223333" }
    prefecture_id { "5" }
  end
end
