class WatchlistsController < ApplicationController
    def index 
        #need user so we can get watchlist and cards in watchlist 
        cards = current_user.watchlist.cards
        render json: cards
    end
end
