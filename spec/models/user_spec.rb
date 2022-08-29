require 'rails_helper'

RSpec.describe User, type: :model do


  before(:each) do
    @user = User.new
  end

  describe 'Validations' do
    it 'saves when all data is present' do
      @valid_user = User.new(first_name: 'D',last_name: 'F', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePassword')
      expect(@valid_user).to be_valid
    end

    it 'has a password' do
      expect(@user).to_not be_valid
      expect(@user.errors.messages[:password]).to include('can\'t be blank')
    end

    it 'has a confirmed passsword' do
      expect(@user).to_not be_valid
      expect(@user.errors.messages[:password_confirmation]).to include('can\'t be blank')
    end

    it 'has the same password and password_confirmation' do
      @valid_user = User.new(first_name: 'D',last_name: 'F', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePasswords')
      expect(@valid_user).to_not be_valid
    end

    it 'requires a minimum password length' do
      expect(@user).to_not be_valid
      expect(@user.errors.messages[:password_confirmation]).to include('is too short (minimum is 6 characters)')
    end

    it 'has an email' do
      expect(@user).to_not be_valid
      expect(@user.errors.messages[:email]).to include('can\'t be blank')
    end

    it 'has a unique email' do
      @valid_user = User.new(first_name: 'D',last_name: 'F', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePassword')
      @valid_user2 = User.new(first_name: 'C',last_name: 'F', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePassword')
      @valid_user.save
      @valid_user2.save
      expect(@valid_user).to be_valid
      expect(@valid_user2).to_not be_valid
      expect(@valid_user2.errors.messages[:email]).to include('has already been taken')
    end
  
    describe '.authenticate_with_credentials' do
      it 'should authenticate if email and password are correct' do
        valid_user = User.new(first_name: 'D',last_name: 'F', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePassword')
        valid_user.save
        user = User.authenticate_with_credentials(valid_user.email, valid_user.password)
        expect(user.email).to eq(valid_user.email)
      end

      it 'should not authenticate if email does not exist in db' do
        valid_user = User.new(first_name: 'D',last_name: 'F', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePassword')
        valid_user.save
        user = User.authenticate_with_credentials('wrongEmail@email.com', valid_user.password)
        expect(user).to eq(nil)
      end

      it 'should not authenticate if password is incorrect' do
        valid_user = User.new(first_name: 'D',last_name: 'F', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePassword')
        valid_user.save
        user = User.authenticate_with_credentials(valid_user.email, 'WrongPassword')
        expect(user).to eq(nil)
      end

      it 'should ignore white spaces in email' do
        valid_user = User.new(first_name: 'D',last_name: 'F', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePassword')
        valid_user.save
        user = User.authenticate_with_credentials('   unique@email.com    ', valid_user.password)
        expect(user.email).to eq(valid_user.email)
      end

      it 'should ignore case for email' do
        valid_user = User.new(first_name: 'D',last_name: 'F', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePassword')
        valid_user.save
        user = User.authenticate_with_credentials('uNiQuE@eMaIl.CoM', valid_user.password)
        expect(user.email).to eq(valid_user.email)
      end

    end  
  end
end


