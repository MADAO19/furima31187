require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'カラム名全てがある場合は登録できること' do
          expect(@user).to be_valid
        end

        context '新規登録がうまくいかないとき' do
          it 'nicknameがない場合は登録できないこと' do
            @user.nickname = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Nickname can't be blank")
          end

          it 'emailがない場合は登録できないこと' do
            @user.email = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Email can't be blank")
          end

          it 'メールアドレスが一意性であること' do
            @user.email
            @user.valid?
            expect(@user.errors.full_messages).to include
          end

          it 'メールアドレスは、@を含む必要があること' do
            @user.email = 'hogehoge'
            @user.valid?
            expect(@user.errors.full_messages).to include('Email is invalid')
          end

          it 'passwordがない場合は登録できないこと' do
            @user.password = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Password can't be blank")
          end

          it 'last_nameがない場合は登録できないこと' do
            @user.last_name = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name can't be blank")
          end

          it 'nameがない場合は登録できないこと' do
            @user.name = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Name can't be blank")
          end

          it 'last_name_kanaがない場合は登録できないこと' do
            @user.last_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana can't be blank")
          end

          it 'name_kanaがない場合は登録できないこと' do
            @user.name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Name kana can't be blank")
          end

          it 'birthdayがない場合は登録できないこと' do
            @user.birthday = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Birthday can't be blank")
          end

          describe 'ユーザーログイン' do
            context 'ログインがうまくいくとき' do
              it 'email,passwordがある場合はログインできること' do
                expect(@user).to be_valid
              end

              context 'ログインがうまくいかないとき' do
                it 'emailがない場合はログインできないこと' do
                  @user.email = ''
                  @user.valid?
                  expect(@user.errors.full_messages).to include("Email can't be blank")
                end

                it 'passwordがない場合はログインできないこと' do
                  @user.password = ''
                  @user.valid?
                  expect(@user.errors.full_messages).to include("Password can't be blank")
                end

                it 'ログアウトがうまくいく' do
                  expect(@user).to be_valid
                end
              end
            end
          end
        end
      end
    end
  end
end
