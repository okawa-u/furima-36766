FactoryBot.define do
  factory :purchase do
    code { '123-5678' }
    area_id { 3 }
    muni { '市町' }
    address      { '番地' }
    building     { '建物名' }
    phone { '0120333906' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
