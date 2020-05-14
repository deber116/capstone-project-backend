class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :portfolios
  has_many :cards, foreign_key: :product_id
end
