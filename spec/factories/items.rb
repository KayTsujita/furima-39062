FactoryBot.define do
  factory :item do
    item_name { 'Apple TV' }
    description { 'abcdefghijklmnop' }
    category_id { '2' }
    condition_id { '2' }
    postage_id { '2' }
    prefecture_id { '23' }
    delivery_time_id { '2' }
    price { '12345' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
