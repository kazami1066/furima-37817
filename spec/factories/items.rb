FactoryBot.define do

  factory :item do
    item_name              {"マスク"}
    item_info              {"立体マスクです"}
    price                  {"500000"}
    category_id            {"2"}
    sales_status_id        {"2"}
    shipping_fee_status_id {"2"}
    prefecture_id          {"2"}
    scheduled_delivery_id  {"2"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/peach.jpeg'), filename: 'test_image.png')
    end
  end

end