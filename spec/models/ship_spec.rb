require 'rails_helper'

RSpec.describe Ship, type: :model do
  before do
    @ship = FactoryBot.build(:ship)
  end

  describe '備品出庫' do
    context '備品出庫できるとき' do
      it 'item_idとquantityがあるとき' do
        expect(@ship).to be_valid
      end
    end

    context '備品出庫できないとき' do
      it 'itemが選択されていないとき' do
        @ship.item = nil
        @ship.valid?
        expect(@ship.errors.full_messages).to include("備品を入力してください")

      end
      it 'quantityが存在していないとき' do
        @ship.quantity = ""
        @ship.valid?
        expect(@ship.errors.full_messages).to include("出庫数を入力してください")
      end

      it 'quantityが0のとき' do
        @ship.quantity = 0
        @ship.valid?
        expect(@ship.errors.full_messages).to include("出庫数は1より大きい値にしてください")
      end

      it 'quantityが全角数値のとき' do
        @ship.quantity = "２"
        @ship.valid?
        expect(@ship.errors.full_messages).to include("出庫数は数値で入力してください")
      end




    end
  end
end