require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new
  end

  describe 'Validations' do
    it 'saves when all data is present' do
      @valid_user = User.new(name: 'D', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePassword')
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

    it 'has the same password and confirmed password' do
      skip
    end

    it 'has an email' do
      expect(@user).to_not be_valid
      expect(@user.errors.messages[:email]).to include('can\'t be blank')
    end

    it 'has a unique email' do
      @valid_user = User.new(name: 'D', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePassword')
      @valid_user2 = User.new(name: 'C', email: 'unique@email.com', password: 'securePassword', password_confirmation: 'securePassword')
      @valid_user.save
      @valid_user2.save

      expect(@valid_user).to be_valid
      expect(@valid_user2).to_not be_valid


      expect(@valid_user2.errors.messages[:email]).to include('has already been taken')

    end
  end
end
