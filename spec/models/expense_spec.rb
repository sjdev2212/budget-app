require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject do
    Expense.new(
      user_id: 1,
      category_id: 1,
      name: 'Cable',
      amount: 50
   
    )
  end
  before { subject.save }

  it 'it should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'it should have an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
  it 'amount should be greater or equal to 0' do
    subject.amount = -15
    expect(subject).to_not be_valid
  end


end