class Ship < ApplicationRecord
  belongs_to :item
  with_options presence: true do
    validates :quantity
  end
end
