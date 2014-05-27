Rails.application.routes.draw do
  root to: 'home#show'
  match '/load_users', to: 'twitter_loader#load_users', via: :get
end
