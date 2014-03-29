Rails.application.routes.draw do
  mount Blogocalypse::Engine, :at => '/blog'
end
