Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :artists, only: :show
    resources :albums, only: :show 
    resources :tracks, only: :show
  end
end
