Rails.application.routes.draw do

  root "static#index"

  resources :users
  resources :blogs do
    resources :comments
  end

  get "login" => "sessions#new" , as: :user_login
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

end
