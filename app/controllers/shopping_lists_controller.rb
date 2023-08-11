class ShoppingListsController < ApplicationController
    def index
        @user_recipes = current_user.recipes.includes(recipe_foods: :food)
        @all_foods = current_user.foods
                                
    end
end
