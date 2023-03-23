FactoryBot.define do
  factory :user do
    nickname              { 'けけけ' }
    email                 { 'kkk@gmail.com' }
    password              { '1111abcd' }
    password_confirmation { password }
    last_name { '辻田' }
    first_name { 'けい' }
    last_name_kana { 'ツジタ' }
    first_name_kana { 'ケイ' }
    birth_date { '1983-09-06' }
  end
end
