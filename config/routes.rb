Rails.application.routes.draw do

  root "sessions#new"

  resources :users
  resources :blogs do
    resources :comments
  end

  get "login" => "sessions#new" , as: :user_login
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

end
