class WatchlistsController < ApplicationController
    def index 
        #need user so we can get watchlist and cards in watchlist 
        cards = current_user.watchlist.cards
        render json: cards
    end

    def create
        result = Card.find_by(product_id: params["card_id"])
        current_user.watchlist.cards << result
        render json: result
    end

    def update
        result = Card.find_by(product_id: params["product_id"])
        current_user.watchlist.cards.each do |card|
            if card.product_id == params["product_id"]
                current_user.watchlist.cards.delete(result)
            end
        end
        updatedWatchlistCards = current_user.watchlist.cards

        render json: updatedWatchlistCards
    end
end
