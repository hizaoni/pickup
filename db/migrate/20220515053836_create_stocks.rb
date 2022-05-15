class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
