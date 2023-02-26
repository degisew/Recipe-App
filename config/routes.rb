Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :recipes do
    resources :recipe_foods
  end
  resources :shopping_lists, only: [:index]
  resources :foods
  resources :public_recipes, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "public_recipes#index"
end
