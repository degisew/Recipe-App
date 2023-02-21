class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    render recipe_path
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
