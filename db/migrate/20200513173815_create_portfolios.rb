class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.text :description

      t.references :watchlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
