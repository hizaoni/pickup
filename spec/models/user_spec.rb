require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる' do
      it 'nameとemailとdivisionとpasswordとpassword_confirmationがあると登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない' do
      it 'nameがないと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailがないと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'divisionがないと登録できない' do
        @user.division = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Division can't be blank")
      end
      it 'passwordがないと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.save
        other_user = FactoryBot.build(:user)
        other_user.password = @user.password
        other_user.valid?
        expect(other_user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nameが全角文字（漢字、かな、カナ）でないと登録できない' do
        @user.name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name 全角文字を使用してください')
      end
      it 'divisionが全角文字（漢字、かな、カナ）でないと登録できない' do
        @user.division = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Division 全角文字を使用してください')
      end
      it '重複したemailは、登録できない' do
        @user.save
        other_user = FactoryBot.build(:user)
        other_user.email = @user.email
        other_user.valid?
        expect(other_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれないと登録できない' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordは6文字以上でないと登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは128文字以下でないと登録できない' do
        @user.password = Faker::Lorem.characters(number: 129, min_alpha: 1, min_numeric: 1)
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordは半角英数字混合であること' do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字を混合して設定してください')
      end
    end
  end
end
