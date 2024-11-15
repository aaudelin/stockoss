Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
    namespace :rest do
      resources :orders
      # resources :line_items
      get "/order/:order_id/line_items" => "line_items#index", as: :line_items
      get "/order/:order_id/line_items/:id" => "line_items#show", as: :line_item
      post "/order/:order_id/line_items" => "line_items#create", as: :line_items_create
      put "/order/:order_id/line_items/:id/validate" => "line_items#validate", as: :line_item_validate
  end
end
