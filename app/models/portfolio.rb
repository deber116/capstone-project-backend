class Portfolio < ApplicationRecord
    belongs_to :watchlist
    has_many :portfolio_cards, dependent: :destroy
    has_many :cards, through: :portfolio_cards

    def recent_prices

        portfolio_prices = []
    
        self.portfolio_cards.each do |pcard|
            linked_card = Card.find_by(product_id: pcard.product_id)
            linked_card_prices = linked_card.prices.where("DATE(created_at) IN (?)", (Date.today - 3.days)..(Date.today.next_day)).order(:created_at)
    
            linked_prices = linked_card_prices.select do |price|
                price.edition == "1st Edition" || price.edition =="Limited"
            end
    
            linked_prices = linked_prices.map do |price|
                {
                    amount: (price.amount * pcard.quantity),
                    edition: price.edition
                }
            end
    
            if portfolio_prices == []
                portfolio_prices = linked_prices
            else
                
                i = 0
                while i < portfolio_prices.count do
                    portfolio_prices[i][:amount] = portfolio_prices[i][:amount] + linked_prices[i][:amount]
                    i += 1
                end 
            end
        end
        portfolio_prices
    end
end
