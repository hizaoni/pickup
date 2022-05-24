FactoryBot.define do
  factory :item do
    name { 'ハサミ' }
    category_id { 2 }
    quantity { 2 }
    order_point { 2 }
    store { '株式会社コクヨ' }
    location { '倉庫A' }
    unit { '本' }
    remarks { 'よく切れる' }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
