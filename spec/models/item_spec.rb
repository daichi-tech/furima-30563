require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品情報の登録" do
    context "商品出品が保存できる" do
      it "iamge,title,information,category_id,status_id,delivery_fee_id,delivery_date_id,prefecture_id,priceが存在する" do
        expect(@item).to be_valid
      end
    end

    context "商品出品が保存できない" do
      it "titleが空の時" do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "imageが空のとき" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "informationが空の時" do
        @item.information = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it "category_idが1のとき" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "status_idが1のとき" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "delivery_fee_idが1のとき" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "delivery_date_idが1のとき" do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
      end
      it "prefecture_idが1のとき" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "priceが空の時" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが半角英数字でない" do
        @item.price = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが9999999円より大きい" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it "priceが300円未満" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "category_idが空の時" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが空の時" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "delivery_fee_idが空の時" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "delivery_date_idが空の時" do
        @item.delivery_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it "prefecture_idが空の時" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "informationが1000字以上の時" do
        @item.information = "#{'a' * 1001}"
        @item.valid?
        expect(@item.errors.full_messages).to include("Information is too long (maximum is 1000 characters)")
      end
      it "titleが40字以上のとき" do
        @item.title = "#{'a' * 41}"
        @item.valid?
        expect(@item.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
      end
    end
  end
end
