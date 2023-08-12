require 'rails_helper'

RSpec.describe 'Integration Testing', type: :system do
  describe 'Should render public recibi' do
    before(:each) do
      @abdi = create(:user, name: "abdi", email: "abdi@gmail.com", password: '1234567', password_confirmation: '1234567')
      sign_in @abdi
    end

    it 'should take the user to the recipe new page' do
      visit new_recipe_path
      click_link 'Back to recipes'
      expect(page).to have_current_path(recipes_path)
    end
  end
end
