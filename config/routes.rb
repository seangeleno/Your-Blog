Rails.application.routes.draw do

  root "static#index"

  get "blogs" => "blogs#index", as: :all_blogs
  resources :users do
    resources :blogs do
      resources :comments
    end
  end

  # get	"/users/:user_id/blogs/:blog_id/comments" => "comments#index" , as: :user_blog_comments_path
  # post	"/users/:user_id/blogs/:blog_id/comments" =>	"comments#create" , as: :user_blog_comments_path
  # get	"/users/:user_id/blogs/:blog_id/comments/new" =>	"comments#new" , as: :new_user_blog_comment_path
  # get	"/users/:user_id/blogs/:blog_id/comments/:id/edit" =>	"comments#edit" , as: :user_blog_comment_path
  # get	"/users/:user_id/blogs/:blog_id/comments/:id" =>	"comments#show" , as: :user_blog_comment_path
  # patch	"/users/:user_id/blogs/:blog_id/comments/:id" =>	"comments#update" , as: :user_blog_comment_path
  # put	"/users/:user_id/blogs/:blog_id/comments/:id" =>	"comments#update" , as: :user_blog_comment_path
  # delete	"/users/:user_id/blogs/:blog_id/comments/:id" =>	"comments#destroy" , as: :user_blog_comment_path
  # get	"/users/:user_id/blogs" =>	"blogs#index" , as: :user_blogs_path
  # post	"/users/:user_id/blogs" =>	"blogs#create" , as: :user_blogs_path
  # get	"/users/:user_id/blogs/new" =>	"blogs#new" , as: :new_user_blog_path
  # get	"/users/:user_id/blogs/:id/edit" =>	"blogs#edit" , as: :edit_user_blog_path
  # get	"/users/:user_id/blogs/:id" =>	"blogs#show" , as: :user_blog_path
  # patch	"/users/:user_id/blogs/:id" =>	"blogs#update" , as: :user_blog_path
  # put	"/users/:user_id/blogs/:id" =>	"blogs#update" , as: :user_blog_path
  # delete	"/users/:user_id/blogs/:id" =>	"blogs#destroy" , as: :user_blog_path
  # get	"/users" =>	"users#index" , as: :users_path
  # post	"/users" =>	"users#create" , as: :users_path
  # get	"/users/new" =>	"users#new" , as: :new_user_path
  # get	"/users/:id/edit" =>	"users#edit" , as: :edit_user_path
  # get	"/users/:id" =>	"users#show" , as: :user_path
  # patch	"/users/:id" =>	"users#update" , as: :user_path
  # put	"/users/:id" =>	"users#update" , as: :user_path
  # delete	"/users/:id" =>	"users#destroy" , as: :user_path

  get "login" => "sessions#new" , as: :user_login
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

end
