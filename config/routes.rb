Rails3DeviseRspecCucumber::Application.routes.draw do
  resources :blog_posts

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :users

  root to: "blog_posts#index"
end
