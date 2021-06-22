require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { User.find_or_create_by(name: 'Power') }
  let(:category) { Category.find_or_create_by(name: 'Power') }
  let(:image_data) do
    "{\"id\":\"8fb5243bf6090c0da13f1537bd295fa8.jpg\",\"storage\":\"store\",\"metadata\":{\"filename\":
    \"marie-curie.jpeg\",\"size\":32152,\"mime_type\":\"image/jpeg\",\"width\":826,\"height\":470}}"
  end

  let(:review) do
    user.reviews.build(title: 'A Title Forever', text: 'Power is Power and there are laws guiding these. Discover them in this book, I did, You too should', image_data: image_data,
                        category_id: category.id)
  end

  describe 'validations:' do
    describe 'title' do
      it 'must be present' do
        expect(review).to be_valid

        review.title = nil
        expect(review).to_not be_valid
      end

      it 'must not exceed 100 characters' do
        expect(review).to be_valid

        review.title = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos voluptas labore cum l
                        aborum laudantium placeat voluptatem ex dolorum voluptatibus possimus!'
        expect(review).to_not be_valid
      end
    end

    describe 'text' do
      it 'must be present' do
        review.text = nil
        expect(review).to_not be_valid
      end
    end

    describe 'image' do
      it 'must be present' do
        review.image = nil
        expect(review).to_not be_valid
      end
    end

    describe 'category' do
      it 'must be present' do
        review.category_id = nil
        expect(review).to_not be_valid
      end
    end
  end

  describe 'associations:' do
    it 'has many votes' do
      review = Review.reflect_on_association(:votes)
      expect(review.macro).to eq(:has_many)
    end

    it 'has many comments' do
      review = Review.reflect_on_association(:comments)
      expect(review.macro).to eq(:has_many)
    end

    it 'belongs to an author' do
      review = Review.reflect_on_association(:author)
      expect(review.macro).to eq(:belongs_to)
    end
  end
end
