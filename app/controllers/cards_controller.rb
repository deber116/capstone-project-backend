class CardsController < ApplicationController
    def create
        #byebug
        #Course.where("LOWER(subject_area) = ? AND cat_number = ?", area.downcase, cat)
        results = []
        if params["search_term"] != ""
            results = Card.where("LOWER(name) LIKE ?","%#{params["search_term"].downcase}%")
        end
        render json: results
    end 
end
