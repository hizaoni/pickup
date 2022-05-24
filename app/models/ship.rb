class Ship < ApplicationRecord
  belongs_to :item
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :item_id, presence: true


end
