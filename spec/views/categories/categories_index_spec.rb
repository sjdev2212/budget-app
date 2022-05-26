require 'rails_helper'

RSpec.describe 'Categories index page', type: :system do
  before do
    User.create(id: 1, name: 'other', email: 'other@name.com', password: 'password')

    Category.create(id: 1, user_id: 1, name: 'Bills', icon: 'bills')
  end

  describe 'Visiting the categories index page' do
    before :each do
      visit '/categories'
      fill_in 'Email', with: 'other@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it "should display the categories's name" do
      expect(page).to have_text('Bills')
    end

    it 'should render a Log Out button' do
      expect(page).to have_link('Sign Out')
    end
    it 'should display the icon' do
      expect(page).to have_css('img')
    end

    it 'should have an add category button' do
      expect(page).to have_link('Add Category')
    end
  end
end
