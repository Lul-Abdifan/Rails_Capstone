require 'rails_helper'

RSpec.describe Food, type: :request do
  describe 'foods route should be available' do
    before(:each) do
      @abdi = User.create!(name: 'Abdi',
                           email: 'a@gmail.com',
                           password: '1234567', password_confirmation: '1234567')
      @shiro = Food.create(name: 'Shiro', measurement_unit: 'KG', price: 45, quantity: 2, user: @abdi)
    end

    it 'should render the food index action correctly' do
      post '/users/sign_in', params: { user: { email: @abdi.email, password: '1234567' } }

      get '/foods'
      expect(response).to be_successful
      expect(response.body).to include('Shiro')
    end

    it 'should allow users to create foods' do
      post '/users/sign_in', params: { user: { email: @abdi.email, password: '1234567' } }

      get '/foods'
      expect(response).to be_successful
      expect(response.body).to include('Add Food')
    end
  end
end
