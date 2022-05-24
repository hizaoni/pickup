FactoryBot.define do
  factory :ship do
    quantity {2}
    association :item
  end
end
