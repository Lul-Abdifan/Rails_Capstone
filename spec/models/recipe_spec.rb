require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let!(:abdi) do
    User.create!(
      name: 'Hope',
      email: 'a@gmail.com', # Use a valid email format
      password: '1234567',
      password_confirmation: '1234567'
    )
  end

  subject do
    Recipe.new(
      name: 'Chicken',
      preparation_time: 80,
      cooking_time: 80,
      description: 'Yummy drums',
      public: false,
      user: abdi # Use the correct user variable name
    )
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a Description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'should save properly with valid attributes' do
    expect(subject).to be_valid
    subject.save
    expect(subject).to be_persisted
  end
end
