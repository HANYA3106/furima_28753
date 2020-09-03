require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("public/images/test_image.png")
  end

  describe '出品機能のテスト' do
    context '出品機能がうまく行くとき' do
      it 'image, name, price, introduction, item_condition_id, potage_payer_id, prefecture_id, preparation_day_id, category_id が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品機能がうまく行かないとき' do
      it 'nameが空だと出品出来ない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'introductionが空だと出品できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'item_condition_idが空だと出品できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'potage_payer_idが空だと出品できない' do
        @item.potage_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を入力してください")
      end
      it 'preparation_day_idが空だと出品できない' do
        @item.preparation_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を入力してください")
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください")
      end
      it 'priceが、¥300~¥9,999,999の間でないと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は一覧にありません")
      end
      it 'priceは半角数字でないと出品できない' do
        @item.price = '５７５'
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は一覧にありません")
      end
      
    end
  end
end
