class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :stocks, dependent: :destroy
  has_many :ships, dependent: :destroy

  belongs_to :category
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :quantity
    validates :order_point
  end
  validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
end
