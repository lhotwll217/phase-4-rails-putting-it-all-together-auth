Rails.application.routes.draw do

  post "/signup", to: "users#create"

  delete "/logout", to: "sessions#destroy"

  post "/login" , to: "sessions#create"

  post "/recipes", to: "recipes#create"

  get "/recipes", to: "recipes#index"

  get "/me" , to: "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
