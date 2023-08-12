class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.public_recipes.includes(:foods)
  end
end
