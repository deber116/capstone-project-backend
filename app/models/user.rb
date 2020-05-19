class User < ApplicationRecord
    has_one :watchlist
    has_many :portfolios, through: :watchlist
    has_secure_password
    validates_uniqueness_of :username, case_sensitive: false
end
