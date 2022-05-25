
require 'rails_helper'

RSpec.describe 'Categories show page', type: :system do
  before do
    User.create(id: 1, name: 'other', email: 'other@name.com', password: 'password')

    Category.create(id: 1, user_id: 1, name: 'Bills', icon: 'bills')
  end

  describe 'Visiting the categories show page' do
    before :each do
      visit '/categories/1'
      fill_in 'Email', with: 'other@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it "should display the categories's name" do
      expect(page).to have_text('Bills')
    end

    it 'should render a add expensebutton' do
        expect(page).to have_link('Add Expense')
      end
  
    it 'should have a go back link' do
      expect(page).to have_link('Go Back')
    end
  end
end