Blogocalypse::Engine.routes.draw do
  root "home#index"
  resources :posts
  resources :images, :only => [ :create, :destroy ]
end
