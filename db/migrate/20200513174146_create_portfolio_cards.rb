class CreatePortfolioCards < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolio_cards do |t|
      t.integer :quantity
      t.integer :product_id
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
