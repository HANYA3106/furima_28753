require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '付与情報の保存' do
    before do
      @purchase = FactoryBot.build(:purchase)
    end

    it '全て値が入っていれば登録できる' do
      expect(@purchase).to be_valid
    end
    it 'post_codeが空だと登録出来ない' do
      @purchase.post_code = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeには - がないと登録出来ない' do
      @purchase.post_code = '1234567'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idが空だと登録出来ない' do
      @purchase.prefecture_id = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと登録出来ない' do
      @purchase.city = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと登録出来ない' do
      @purchase.house_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと登録出来ない' do
      @purchase.phone_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberは − があると登録出来ない' do
      @purchase.phone_number = '012-3456-7890'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid.")
    end

  end
end
