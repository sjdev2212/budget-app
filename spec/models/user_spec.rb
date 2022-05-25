require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Bruno',
      id: 1,
   email: 'dinitis@gmail.com',
   password: 313131
    )
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'should have an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

 
end