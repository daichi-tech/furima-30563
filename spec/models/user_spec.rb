require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在する" do
        expect(@user).to be_valid
      end

      it "passwordが英数学かつ6文字以上である" do
        @user.password = "aaaaa1"
        @user.password_confirmation = "aaaaa1"
        expect(@user).to be_valid
      end

      it "first_nameが全角である" do
        @user.first_name = "隆太郎"
        expect(@user).to be_valid
      end

      it "last_nameが全角である" do
        @user.last_name = "山田"
        expect(@user).to be_valid
      end

      it "first_name_kanaが全角カタカナである" do
        @user.first_name_kana = "リクタロウ"
        expect(@user).to be_valid
      end

      it "last_name_kanaが全角カタカナである" do
        @user.last_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end

    end

    context "新規登録がうまくいかないとき" do

      it "nicknameが空のとき" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空のとき" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空のとき" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordとpassword_confirmationが一致しないとき" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "first_nameが空のとき" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_nameが空のとき" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_name_kanaが空のとき" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "last_name_kanaが空のとき" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "birthdayが空のとき" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "登録されたemailが重複したとき" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが5文字以下" do
        @user.password = "aaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが英数字混合以外のとき" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "firstnameが全角でないとき" do
        @user.first_name = "daichi"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "lastnameが全角でないとき" do
        @user.last_name = "sasaki"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "firstname-kanaが全角カナでないとき" do
        @user.first_name_kana = "大地"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "lastname-kanaが全角カナでないとき" do
        @user.last_name_kana = "佐佐木"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "emailに@が含まれてないとき" do
        @user.email = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end


