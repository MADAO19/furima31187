FactoryBot.define do
  factory :item do
    name { Faker::Games::Zelda.item }
    description { Faker::Quote.matz }
    category_id { 2 }
    status_id { 2 }
    deliverycharge_id { 2 }
    prefecture_id { 2 }
    daystoship_id { 2 }
    price { 12_345 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
    end
  end
end
