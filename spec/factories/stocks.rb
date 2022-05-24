FactoryBot.define do
  factory :stock do
    quantity {2}
    association :item
  end
end
