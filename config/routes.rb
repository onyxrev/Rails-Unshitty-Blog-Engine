Blogocalypse::Engine.routes.draw do
  root "home#index"
  resources :posts
  resources :post_tags, :except => [ :create, :update, :destroy ]
  resources :images,    :only =>   [ :create, :destroy ]
end
