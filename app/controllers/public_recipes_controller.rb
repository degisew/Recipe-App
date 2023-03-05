class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.all.where(public: true).order(created_at: :desc)
  end
end
