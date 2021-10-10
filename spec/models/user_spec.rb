require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる場合' do

      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user.errors.full_messages).to include("")
      end

    end

    context '新規登録できない場合' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '英字のみのパスワードでは登録できない'do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '数字のみのパスワードでは登録できない'do
        
      end
      it '全角文字を含むパスワードでは登録できない'do
        
      end
      it '姓（全角）が空だと登録できない'do
      @user.last_name = ''
      @user.valid?
    end
      it '姓（全角）に半角文字が含まれていると登録できない'do
        
      end
      it '名（全角）が空だと登録できない'do
      @user.first_name = ''
      @user.valid?
    end
      it '名（全角）に半角文字が含まれていると登録できない'do
        
      end
      it '姓（カナ）が空だと登録できない'do
      @user.last_name_kana = ''
      @user.valid?
    end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない'do
        
      end
      it '名（カナ）が空だと登録できない'do
      @user.first_name_kana = ''
      @user.valid?
    end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない'do
        
      end
      it '生年月日が空だと登録できない'do
      @user.birth = ''
      @user.valid?
    end
    end

  end
end
