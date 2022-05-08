FactoryBot.define do
  factory :order_address do

    
    token {"tok_abcdefghijk00000000000000000"}

    postal_code   {"133-3333"}
    prefecture_id { 2 }
    city          {"test"}
    addresses     {"test"}
    building      {"test"}
    phone_number  {"08011112222"}
    user_id       { 1 }
    item_id       { 1 }
  end
end
