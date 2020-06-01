class PortfoliosController < ApplicationController
    def index
        portfolios = current_user.portfolios
        render json: portfolios
    end
    
    def create
        current_watchlist = Watchlist.find_by(user_id: current_user.id)

        newPortfolio = Portfolio.create(name: params["name"], description: params["description"], watchlist_id: current_watchlist.id)

        portfolioCards = params["portfolioCards"].map do |card|
            new_pc = Card.find_by(product_id: card["product_id"])
            PortfolioCard.create(product_id: new_pc.product_id, portfolio_id: newPortfolio.id, quantity: card["quantity"])
        end

        render json: newPortfolio

    end

    def update 
        current_watchlist = Watchlist.find_by(user_id: current_user.id)

        edit_portfolio = Portfolio.find(params[:id].to_i)
        edit_portfolio.name = params["name"]
        edit_portfolio.description = params["description"]
        edit_portfolio.save

        edit_portfolio.portfolio_cards.each {|pc| pc.destroy}
        portfolioCards = params["portfolioCards"].map do |card|
            new_pc = Card.find_by(product_id: card["product_id"])
            PortfolioCard.create(product_id: new_pc.product_id, portfolio_id: edit_portfolio.id, quantity: card["quantity"])
        end

        render json: edit_portfolio
    end

    def destroy 
        portfolio = Portfolio.find(params["id"])
        portfolio.destroy
        render json: current_user.portfolios
    end
end
