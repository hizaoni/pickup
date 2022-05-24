require 'rails_helper'

RSpec.describe Stock, type: :model do
  before do
    @stock = FactoryBot.build(:stock)
  end

  describe '備品入庫' do
    context '備品入庫できるとき' do
      it 'item_idとquantityがあるとき' do
        expect(@stock).to be_valid
      end
    end

    context '備品入庫できないとき' do
      it 'itemが選択されていないとき' do
        @stock.item = nil
        @stock.valid?
        expect(@stock.errors.full_messages).to include("備品を入力してください")

      end
      it 'quantityが存在していないとき' do
        @stock.quantity = ""
        @stock.valid?
        expect(@stock.errors.full_messages).to include("入庫数を入力してください")
      end

      it 'quantityが0のとき' do
        @stock.quantity = 0
        @stock.valid?
        expect(@stock.errors.full_messages).to include("入庫数は1より大きい値にしてください")
      end

      it 'quantityが全角数値のとき' do
        @stock.quantity = "２"
        @stock.valid?
        expect(@stock.errors.full_messages).to include("入庫数は数値で入力してください")
      end


    end
  end
end
