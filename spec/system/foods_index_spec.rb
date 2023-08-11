require 'rails_helper'

RSpec.describe 'Integration Testing', type: :system do
  describe 'Foods index page' do
    before(:each) do
      @abdi = create(:user, name: "abdi", email: "abdi@gmail.com", password: '1234567', password_confirmation: '1234567')
      sign_in @abdi
      @shiro = Food.create(name: 'Shiro', measurement_unit: 'KG', price: 45, quantity: 2, user: @abdi)
    end

    it "displays food name" do
      visit foods_path
      expect(page).to have_content(@shiro.name)
    end

    it "displays food measurement_unit" do
      visit foods_path
      expect(page).to have_content(@shiro.measurement_unit)
    end


    it "has a delete button" do
      visit foods_path
      expect(page).to have_button('Delete')
    end


    it "redirects to its own page" do
      visit foods_path
      click_button('Delete')
     expect(page).to have_current_path(foods_path)
    end
  end
end
