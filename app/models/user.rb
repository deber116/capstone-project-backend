class User < ApplicationRecord
    has_one :watchlist
    has_many :portfolios, through: :watchlist
end
