class Card < ApplicationRecord
    belongs_to :set_group, foreign_key: :group_id
    has_many :portfolio_cards
    has_many :prices, foreign_key: :product_id
    has_many :watchlists, through: :watchlist_cards
    self.primary_key = :product_id
end
