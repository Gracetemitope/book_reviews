require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'complete params' do
    before do
      @user = User.create(name: 'David')
    end
    it 'creates a user' do
      expect(@user).to be_valid
    end

    it 'finds a user' do
      expect(User.find_by(name: 'david')).to eq(@user)
    end
  end
  describe 'incomplete params' do
    before do
      @user = User.create(email: 'davi@email.com')
    end

    it 'does not create a user' do
      expect(@user).not_to be_valid
    end

    it ' does not finds a user' do
      expect(User.find_by(name: 'David')).not_to eq(@user)
    end
  end
end
