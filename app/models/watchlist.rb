class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :portfolios
  has_many :cards, through: :watchlist_cards
end
