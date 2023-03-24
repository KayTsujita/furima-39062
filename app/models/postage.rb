class Postage < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '送料込み' },
    { id: 3, name: '着払い' }
  ]

  include ActiveHash::Associations
  has_many :items
  
end