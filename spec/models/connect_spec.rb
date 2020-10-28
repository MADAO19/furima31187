require 'rails_helper'

RSpec.describe Connect, type: :model do
  describe '#create' do
    before do
      @connect = build(:connect)
end
describe '商品購入' do
  context '商品購入がうまくいくとき' do
    it 'カラム名全てがある場合は購入できること' do
      expect(@connect).to be_valid
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeがない場合は登録できない' do
        @connect.postal_code = ''
            @connect.valid?
            expect(@connect.errors.full_messages).to include("Postal code can't be blank")
         end

         it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @connect.postal_code = '1234567'
          @connect.valid?
          expect(@connect.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end

    it 'prefecture_idがない場合は登録できない' do
      @connect.prefecture_id = ''
          @connect.valid?
          expect(@connect.errors.full_messages).to include("Prefecture is not a number")
        end

        it 'municipal_districtがない場合は登録できない' do
          @connect.municipal_district = ''
              @connect.valid?
              expect(@connect.errors.full_messages).to include("Municipal district can't be blank")
            end

            it 'addressがない場合は登録できない' do
              @connect.address = ''
                  @connect.valid?
                  expect(@connect.errors.full_messages).to include("Address can't be blank")
                end

                it 'building_nameは空でも保存できること' do
                  @connect.building_name = nil
                  expect(@connect).to be_valid
                end

                it 'phone_numberがない場合は登録できない' do
                  @connect.phone_number = ''
                      @connect.valid?
                      expect(@connect.errors.full_messages).to include("Phone number can't be blank")
                    end
    
    
end
end
end
end
end