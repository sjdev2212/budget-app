require 'rails_helper'

RSpec.describe 'Add category page', type: :feature do
  before do
    User.create(id: 1, name: 'name', email: 'name@name.com',
                password: 'password')
  end

  describe 'Visiting the add category page' do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit '/categories/new'
    end

    it 'should have category name input field' do
      expect(page).to have_text('Category name')
    end

    it 'should have Icon Type text' do
      expect(page).to have_text('Icon type')
    end

    it 'should have a save button' do
      expect(page).to have_button('Save')
    end

    it 'Should add successfully' do
      fill_in 'Category name', with: 'Bills'
      click_button 'Save'
      expect(page.current_path).to have_content('/categories')
    end
  end
end
