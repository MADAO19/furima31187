FactoryBot.define do
  factory :user do
    nickname { 'taro' }
    email { Faker::Internet.free_email }
    password { 's123456' }
    last_name { '山田' }
    name { '太郎' }
    last_name_kana { 'ヤマダ' }
    name_kana { 'タロウ' }
    birthday { Faker::Date.in_date_period(year: 2018, month: 2) }
  end
end
