require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) do
    User.create!(
      name: 'Hope',
      email: 'hope@example.com',
      password: '1234567',
      password_confirmation: '1234567'
    )
  end

  let(:recipe) do
    Recipe.create!(
      name: 'Chicken',
      preparation_time: 70,
      cooking_time: 70,
      description: 'Yummy drums',
      public: false,
      user: user
    )
  end

  let(:food) do
    Food.create!(
      name: 'Chicken',
      quantity: 2,
      measurement_unit: 'kg',
      price: 45,
      user: user
    )
  end

  subject do
    RecipeFood.new(recipe_id: recipe.id, food_id: food.id, quantity: 5)
  end

  it 'should have a recipe' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a food' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a number' do
    subject.quantity = 'abc'
    expect(subject).to_not be_valid
  end

  it 'should save properly with valid attributes' do
    expect(subject).to be_valid
    subject.save
    expect(subject).to be_persisted
  end
end
