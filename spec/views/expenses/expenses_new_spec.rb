require 'rails_helper'

RSpec.describe 'Add expense page', type: :feature do
  before do
    User.create(id: 1, name: 'name', email: 'name@name.com',
                password: 'password')

    Category.create(id: 1, user_id: 1, name: 'Bills', icon: 'bills')
  end

  describe 'Visiting the add expense page' do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit '/categories/1/expenses/new'
    end

    it 'should have expense name input field' do
      expect(page).to have_text('Expense name')
    end

    it 'should have amount input field' do
      expect(page).to have_text('Amount')
    end

    it 'should have a save button' do
      expect(page).to have_button('Save')
    end
    it 'should have ago back link' do
      expect(page).to have_link('Go Back')
    end
  end
end
