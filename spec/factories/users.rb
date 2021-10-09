FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { ‘a1’ + Faker::Internet.password(min_length: 4) }
    password { password }
    password_confirmation { password }
    last_name
    first_name
    last_name_kana
    first_name_kana
    birth
  end
end
