Rails.application.routes.draw do
  resources :watchlist_cards
  resources :watchlists
  resources :set_groups
  resources :portfolio_cards
  resources :prices
  resources :portfolios
  resources :cards
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
