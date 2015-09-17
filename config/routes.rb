Rails.application.routes.draw do

  root "static#index"

  get "login" => "sessions#new" , as: :user_login
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy" 

  resources :users do
    resources :blogs do
      resources :comments
    end
  end


end
