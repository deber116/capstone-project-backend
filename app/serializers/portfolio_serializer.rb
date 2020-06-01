class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :recent_prices, :portfolio_cards, :cards

  def recent_prices
    self.object.recent_prices
  end

  def cards
    # self.object.portfolio_cards.map do |p| 
    #   "hi"
    # end
    self.object.portfolio_cards.map do |pcard|
      card = Card.find_by(product_id: pcard.product_id)
      newCard = {
        name: card.name,
        set_name: card.set_group.name, 
        product_id: card.product_id, 
        quantity: pcard.quantity,
        img_url: card.img_url,
        rarity: card.rarity,
        attack: card.attack,
        defense: card.defense,
        monster_type: card.monster_type,
        description: card.description,
        card_type: card.card_type,
        attrbute: card.attrbute
      }
      newCard
    end
  end

end

