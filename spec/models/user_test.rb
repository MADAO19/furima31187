require 'test_helper'
describe User do
  describe '#create' do

before do
  @user = build(:user)
end

  it "nicknameがない場合は登録できないこと" do
    @user = nickname: ""
    @user.valid?
    expect(@user.errors[:nickname]).to include("can't be blank")
  end

  it "emailがない場合は登録できないこと" do
    @user = email: ""
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end

  it "メールアドレスが一意性であること" do
    @user = email:
    @user.valid?
    expect(@user.errors).to be_added(:email, :taken)
    end

    it "メールアドレスは、@を含む必要があること" do
      @user = email:
      @user.valid?
      expect(@user.errors).to include(:email, "@")
      end

  it "passwordがない場合は登録できないこと" do
    @user = password: ""
    @user.valid?
    expect(@user.errors[:password]).to include("can't be blank")
  end

  it "last_nameがない場合は登録できないこと" do
    @user = last_name: ""
    @user.valid?
    expect(@user.errors[:last_name]).to include("can't be blank")
    end

  it "nameがない場合は登録できないこと" do
    @user = name: ""
    @user.valid?
    expect(@user.errors[:name]).to include("can't be blank")
    end

  it "last_name_kanaがない場合は登録できないこと" do
    @user = last_name_kana: ""
    @user.valid?
    expect(@user.errors[:last_name_kana]).to include("can't be blank")
    end

  it "name_kanaがない場合は登録できないこと" do
    @user = name_kana: ""
    @user.valid?
    expect(@user.errors[:name_kana]).to include("can't be blank")
    end
      
  it "birthdayがない場合は登録できないこと" do
    @user = birthday: ""
    @user.valid?
    expect(@user.errors[:birthday]).to include("can't be blank")
    end

    end
    end
        
  