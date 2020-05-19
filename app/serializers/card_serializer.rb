class CardSerializer < ActiveModel::Serializer
  attributes :name, :rarity, :attack, :defense, :img_url, :set_name, :monster_type, :description, :card_type, :attrbute, :recent_prices

  def set_name
    self.object.set_group.name
  end

  def recent_prices
    #self.object.prices.where("DATE(created_at) IN (?)", (Date.today)..(Date.today.next_day))
    self.object.prices.last(2)
  end
end
