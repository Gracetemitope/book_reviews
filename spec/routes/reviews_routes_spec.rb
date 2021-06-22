require 'rails_helper'

RSpec.describe ReviewsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: 'reviews').to route_to('reviews#create')
    end

    it 'routes to #update' do
      expect(patch: '/reviews/1').to route_to('reviews#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'reviews/1').to route_to('reviews#destroy', id: '1')
    end

    it 'routes to #show' do
      expect(get: 'reviews/1').to route_to('reviews#show', id: '1')
    end
  end
end
