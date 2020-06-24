Rails.application.routes.draw do
  resources :api_tokens
  resources :watchlist_cards
  resources :watchlists
  resources :set_groups
  resources :portfolio_cards
  resources :prices
  resources :portfolios
  resources :cards
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
