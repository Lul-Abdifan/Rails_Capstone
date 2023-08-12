require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) do
    User.create!(
      name: 'Hope',
      email: 'hope@example.com',
      password: '1234567',
      password_confirmation: '1234567'
    )
  end

  subject do
    Food.new(
      name: 'Chicken',
      quantity: 2,
      measurement_unit: 'kg',
      price: 45,
      user: user
    )
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'should have a number' do
    subject.quantity = 'abc'
    expect(subject).to_not be_valid
  end
end
