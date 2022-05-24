FactoryBot.define do
  factory :ship do
    quantity {2}
    item_id {2}
    association :item
  end
end
