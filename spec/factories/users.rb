FactoryBot.define do
  factory :user do
    nickname { "だいち111" }
    email { Faker::Internet.free_email }
    password { "daidai1" }
    password_confirmation {password}
    first_name { "大地" }
    last_name { "佐佐木" }
    first_name_kana { "ダイチ" }
    last_name_kana { "ササキ" }
    birthday { "1994-11-24" }
    
  end
end
