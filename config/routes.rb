Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # See all restaurants
  get "/restaurants", to: "restaurants#index"
  get "/restaurants/new", to: "restaurants#new"
  post "/restaurants", to: "restaurants#create"
  get "/restaurants/:id", to: "restaurants#show", as: "restaurant"

  # A visitor can add a new review to a restaurant
  get " /restaurants/:restaurant_id/reviews/new", to: "reviews#new", as: "new_review"
  post "/restaurants/:restaurant_id/reviews", to: "reviews#create"
  
  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
  end

  # Update a restaurant
  # get "/restaurants/:id/edit", to: "restaurants#edit"
  # patch "/restaurants/:id", to: "restaurants#update"
  # Destroy a restaurant
  # delete "/restaurants/:id", to: "restaurants#destroy"
  # resources :restaurants, only: [ :index, :show ]

end
