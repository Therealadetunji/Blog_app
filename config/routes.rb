Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/users", to: "users#index", as: "users"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/posts", to: "posts#index", as: "users_posts"
  get "/users/:user_id/posts/new", to: "posts#new", as: "new_post"
  get "/users/:id/posts/:id", to: "posts#show", as: "users_post"
  get "/users/:user_id/posts/:post_id/comments/new", to: "comments#new"

  
  post "/users/:user_id/posts", to: "posts#create"
  post "/users/:user_id/posts/:post_id/likes", to: "likes#create"
  post "/users/:user_id/posts/:post_id/comments", to: "comments#create"

  root "users#index"


  

  resources :users do
    resources :posts do
      resources :likes
      resources :comments
    end
  end

end
