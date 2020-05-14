class Portfolio < ApplicationRecord
    belongs_to :watchlist
    has_many :portfolio_cards 
    has_many :cards, through: :portfolio_cards
end
