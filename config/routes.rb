Rails.application.routes.draw do

  root "static#index"

  resources :blogs , :only => [ :index , :show ]
  resources :users do
    resources :blogs do
      resources :comments
    end
  end

  get "login" => "sessions#new" , as: :user_login
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy" , as: :logout

end
