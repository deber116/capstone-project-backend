class Price < ApplicationRecord
  belongs_to :card, foreign_key: :product_id
end
