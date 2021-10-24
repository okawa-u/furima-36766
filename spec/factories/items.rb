FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'flag.png')
    end
    name { 'sample' }
    explanation { 'aaaaa' }
    category_id { 2 }
    state_id { 2 }
    fee_id     { 2 }
    area_id    { 2 }
    delivery_day_id   { 2 }
    price             { 11_111 }
    # データを生成するための記述
    association :user
  end
end
