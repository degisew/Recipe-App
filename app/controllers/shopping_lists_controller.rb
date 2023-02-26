class ShoppingListsController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @shopping_lists = RecipeFood.includes(:food).all
    @total_price = sum(@shopping_lists)
  end

  private

  def sum(shopping_lists)
    total = 0
    shopping_lists.each do |item|
      total += item.food.price * item.quantity.to_i
    end
    total
  end
end
