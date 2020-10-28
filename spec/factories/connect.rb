FactoryBot.define do
  factory :connect do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipal_district { '東京都渋谷区' }
    address { '渋谷１−１−１' }
    building_name { '渋谷ハイツ' }
    phone_number { '000-0000-0000' }
  end
end
