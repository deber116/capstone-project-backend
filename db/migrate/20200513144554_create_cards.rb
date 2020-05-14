class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards, id: false do |t|
      t.primary_key :product_id
      t.string :name
      t.string :rarity
      t.integer :attack
      t.integer :defense
      t.string :img_url
      t.integer :group_id
      t.string :monster_type
      t.text :description
      t.string :card_type
      t.string :attrbute

      t.timestamps
    end
  end
end
