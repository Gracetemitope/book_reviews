require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'associations:' do
    it 'belongs to a review' do
      vote = Vote.reflect_on_association(:review)
      expect(vote.macro).to eq(:belongs_to)
    end

    it 'belongs to a user' do
      vote = Vote.reflect_on_association(:user)
      expect(vote.macro).to eq(:belongs_to)
    end
  end
end
