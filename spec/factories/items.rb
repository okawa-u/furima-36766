FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    category_id { 2 }
    state_id { 2 }
    fee_id { 2 }
    area_id { 2 }
    delivery_day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
