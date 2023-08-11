class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy toggle_public]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show

    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods

  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    authorize! :update, @recipe
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = current_user.recipes.build(recipe_params)
    authorize! :create, @recipe
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    authorize! :update, @recipe

    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_public
    authorize! :update, @recipe

    new_public_status = !@recipe.public
    if @recipe.update(public: new_public_status)
      render json: { public: new_public_status }, status: :ok
    else
      render json: { error: 'Failed to toggle public status' }, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    authorize! :destroy, @recipe
    if @recipe.user == current_user
      @recipe.destroy
      redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
    else
      redirect_to recipes_url, alert: "You don't have permission to delete this recipe."
    end
  rescue CanCan::AccessDenied
    redirect_to recipes_url, alert: "You don't have permission to delete this recipe."
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
