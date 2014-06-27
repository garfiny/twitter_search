Rails.application.routes.draw do
  root to: 'home#show'
  match '/load_users', to: 'twitter_loader#load_users', via: :get
  match '/load_trends', to: 'twitter_loader#load_trends', via: :get
  match '/show_progress', to: 'twitter_loader#show_progress', via: :get
  match '/search', to: 'twitter_search#search', via: :get
end
