Rails.application.routes.draw do

  root "static#index"

  get "blogs/index" => "blogs#index" , as: :blogs_path
  get "blogs/show" => "blogs#show" , as: :blogs_show

  resources :users do
    resources :blogs do
      resources :comments
    end
  end

  get "login" => "sessions#new" , as: :user_login
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy" , as: :logout

end
