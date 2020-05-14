class SetGroup < ApplicationRecord
    has_many :cards, foreign_key: :product_id

    self.primary_key = :group_id
end
