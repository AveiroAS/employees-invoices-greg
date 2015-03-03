Rails.application.routes.draw do
  resources :documents

  root 'dashboard#home'
  resources :users do
    member do
      post :assign_role
      post :withdraw_role
    end
  end

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
