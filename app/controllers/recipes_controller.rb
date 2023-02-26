class RecipesController < ApplicationController
  before_action :authenticate_user!
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.includes(:user).where(user_id: current_user).order(created_at: :desc)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  # def edit
  # end

  # POST /recipes or /recipes.json
  def create
    @new_recipe = current_user.recipes.new(recipe_params)

    respond_to do |format|
      if @new_recipe.save
        format.html { redirect_to recipes_url(@new_recipe), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find_by(id: params[:id])

    respond_to do |format|
      if @recipe.destroy
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      else
        format.html { redirect_to recipe_url, notice: 'Failed to delete the recipe. Please try again!' }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
