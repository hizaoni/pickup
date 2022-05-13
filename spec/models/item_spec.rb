require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "備品新規登録" do
    context "新規登録できる" do
      it "nameとcategory_idとquantityとorder_pointとstoreとlocationとunitとremarksとimageがあれば登録できる" do
        expect(@item).to be_valid
      end
      it "nameとcategory_idとquantityとorder_pointとstoreとlocationとunitとremarksがあれば登録できる" do
        @item.image = nil
        expect(@item).to be_valid
      end
      it "nameとcategory_idとquantityとorder_pointとstoreとlocationとunitとimageがあれば登録できる" do
        @item.remarks = ""
        expect(@item).to be_valid
      end
      it "nameとcategory_idとquantityとorder_pointとstoreとlocationとremarksとimageがあれば登録できる" do
        @item.unit = ""
        expect(@item).to be_valid
      end
      it "nameとcategory_idとquantityとorder_pointとstoreとunitとremarksとimageがあれば登録できる" do
        @item.location = ""
        expect(@item).to be_valid
      end
      it "nameとcategory_idとquantityとorder_pointとlocationとunitとremarksとimageがあれば登録できる" do
        @item.store = ""
        expect(@item).to be_valid
      end
      it "nameとcategory_idとquantityとorder_pointとstoreとlocationとimageがあれば登録できる" do
        @item.remarks = ""
        @item.unit = ""
        expect(@item).to be_valid
      end
      it "nameとcategory_idとquantityとorder_pointとstoreとimageがあれば登録できる" do
        @item.remarks = ""
        @item.unit = ""
        @item.location = "" 
        expect(@item).to be_valid
      end
      it "nameとcategory_idとquantityとorder_pointとimageがあれば登録できる" do
        @item.remarks = ""
        @item.unit = ""
        @item.location = ""
        @item.store = ""
        expect(@item).to be_valid
      end
      it "nameとcategory_idとquantityとorder_pointがあれば登録できる" do
        @item.image = nil
        @item.remarks = ""
        @item.unit = ""
        @item.location = ""
        @item.store = ""
        expect(@item).to be_valid
      end
    end
    context "新規登録できない" do
      it 'nameがないと登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'category_idを選択しないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idを選択しないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'quantityがないと登録できない' do
        @item.quantity = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Quantity can't be blank")
      end
      it 'order_pointがないと登録できない' do
        @item.order_point = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Order point can't be blank")
      end
    end
  end
end
