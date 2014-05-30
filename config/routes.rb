Rails.application.routes.draw do
  root to: 'home#show'
  match '/load_users', to: 'twitter_loader#load_users', via: :get
  match '/show_progress', to: 'twitter_loader#show_progress', via: :get
end
