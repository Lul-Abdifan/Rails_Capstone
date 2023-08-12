class ShoppingListsController < ApplicationController
  def index
    user_recipes = current_user.recipes.includes(recipe_foods: :food)
    user_foods = current_user.foods.pluck(:name, :quantity, :price, :measurement_unit)

    @food_totals = {}

    user_foods.each do |food_name, quantity, price, measurement_unit|
      @food_totals[food_name] =
        { quantity: quantity, total_price: quantity * price, measurement_unit: measurement_unit }
    end

    user_recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        food_name = recipe_food.food.name
        quantity = recipe_food.quantity
        price_per_unit = recipe_food.food.price

        @food_totals[food_name] ||= { quantity: 0, total_price: 0 }

        if quantity && price_per_unit
          @food_totals[food_name][:quantity] -= quantity
          @food_totals[food_name][:total_price] -= quantity * price_per_unit
        end
      end
    end
  end
end
