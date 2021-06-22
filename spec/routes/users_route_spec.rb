require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: 'users/sign_up').to route_to('devise/registrations#new')
    end

    it 'routes to #signin' do
      expect(get: 'users/sign_in').to route_to('devise/sessions#new')
    end

    it 'routes to #destroy_session' do
      expect(get: 'users/sign_out').to route_to('devise/sessions#destroy')
    end
  end
end
