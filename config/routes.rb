Rails.application.routes.draw do
  resources :destinations
  resources :posts
  resources :titles
  resources :bloggers
  post "/posts/:id/like", to: "posts#addlike", as: "like"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
