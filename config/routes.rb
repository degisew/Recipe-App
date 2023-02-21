Rails.application.routes.draw do
  resources :users do
  resources :foods do
  resources :recipes
  resources :recipe_foods
  end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
