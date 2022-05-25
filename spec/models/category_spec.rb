require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    Category.new(
      user_id: 1,
      name: 'Bills',
      icon: 'bills',
   
    )
  end
  before { subject.save }

  it 'it should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'it should have an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end


end