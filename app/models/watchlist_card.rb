class WatchlistCard < ApplicationRecord
    belongs_to :card, foreign_key: :product_id
    belongs_to :watchlist
    
end
