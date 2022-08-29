require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new
  end

  describe 'User Validations' do
    it 'saves when all data is present' do
      @valid_user = User.new(first_name: 'D', last_name: 'F', email: 'unique@email.com', password: 'securePassword', passsword_confirmation: 'securePassword')
      expect(@valid_user).to be_valid
    end

    it 'has a password' do
      skip
    end

    it 'has a confirmed passsword' do
      skip
    end

    it 'has the same password and confirmed password' do
      skip
    end

    it 'has an email' do
      skip
    end

    it 'has an email not in the db (db is not case sensitive)' do
      skip
    end

    it 'has a first name' do
      skip
    end

    it 'has a last name' do
      skip
    end

  end
end
