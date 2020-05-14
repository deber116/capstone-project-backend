class CreateWatchlistCards < ActiveRecord::Migration[6.0]
  def change
    create_table :watchlist_cards do |t|
      t.integer :product_id

      t.timestamps
    end
  end
end
