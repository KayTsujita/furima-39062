FactoryBot.define do
  factory :purchase_address do
    postcode { '123-1234' }
    prefecture_id { '14' }
    city { '文京区' }
    address { '根津1-2-3' }
    phone { '09012345678' }
    user_id {'2'}
    item_id {'4'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
