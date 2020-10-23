require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = build(:item)
    end

    describe '商品出品' do
      context '商品出品がうまくいくとき' do
        it 'カラム名全てがある場合は出品できること' do
          expect(@item).to be_valid
        end

        context '商品出品がうまくいかないとき' do
          it 'imageがない場合は出品できないこと' do
            @item.image = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Image can't be blank")
          end

          it 'nameがない場合は出品できないこと' do
            @item.name = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Name can't be blank")
          end

          it 'descriptionがない場合は出品できないこと' do
            @item.description = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Description can't be blank")
          end

          it 'category_idを選択していない場合は出品できないこと' do
            @item.category_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include('Category is not a number')
          end

          it 'category_idの１を選択している場合は出品できないこと' do
            @item.category_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include('Category must be other than 1')
          end

          it 'status_idを選択していない場合は出品できないこと' do
            @item.status_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include('Status is not a number')
          end

          it 'status_idの１を選択している場合は出品できないこと' do
            @item.status_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include('Status must be other than 1')
          end

          it 'deliverycharge_idを選択していない場合は出品できないこと' do
            @item.deliverycharge_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include('Deliverycharge is not a number')
          end

          it 'deliverycharge_idの１を選択している場合は出品できないこと' do
            @item.deliverycharge_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include('Deliverycharge must be other than 1')
          end

          it 'prefecture_idを選択していない場合は出品できないこと' do
            @item.prefecture_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include('Prefecture is not a number')
          end

          it 'prefecture_idの１を選択している場合は出品できないこと' do
            @item.prefecture_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
          end

          it 'daystoship_idを選択していない場合は出品できないこと' do
            @item.daystoship_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include('Daystoship is not a number')
          end

          it 'daystoship_idの１を選択している場合は出品できないこと' do
            @item.daystoship_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include('Daystoship must be other than 1')
          end

          it 'priceがない場合は出品できないこと' do
            @item.price = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")
          end

          it 'priceを半角数字で入力していない場合は出品できないこと' do
            @item.price = 'hoge'
            @item.valid?
            expect(@item.errors.full_messages).to include('Price is not included in the list')
          end

          it 'priceが300円以下の場合は出品できないこと' do
            @item.price = 299
            @item.valid?
            expect(@item.errors.full_messages).to include('Price is not included in the list')
          end

          it 'priceが9999999円以上の場合は出品できないこと' do
            @item.price = 10000000
            @item.valid?
            expect(@item.errors.full_messages).to include('Price is not included in the list')
          end
        end
      end
    end
  end
end
