require 'rails_helper'

RSpec.describe 'Integration Testing', type: :system do
  describe 'Foods index page' do
    before(:each) do
      @abdi = create(:user, name: "abdi", email: "abdi@gmail.com", password: '1234567', password_confirmation: '1234567')
      sign_in @abdi
    end

    it "has shopping list header" do 
      visit shopping_lists_path
      expect(page).to have_content("Shopping List")
    end

    it "displays table headers" do 
        visit shopping_lists_path
        expect(page).to have_selector('th', text: 'Food')
        expect(page).to have_selector('th', text: 'Quantity')
        expect(page).to have_selector('th', text: 'Price')
      end
    end
  end
 

  
  
  
  
  

