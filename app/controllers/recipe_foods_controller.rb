class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  # def show
  # end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
    @all_foods = current_user.foods.all
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @new_recipe_food = @recipe.recipe_foods.new(recipe_food_params)

    respond_to do |format|
      if @new_recipe_food.save
        format.html { redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find_by(id: params[:id])
    respond_to do |format|
      if @recipe_food.destroy
        format.html { redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully destroyed.' }
      else
        format.html { redirect_to recipe_recipe_food_url, notice: 'Failed to delete Recipe Food. Please try again!' }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
