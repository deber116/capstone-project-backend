class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.float :amount
      t.integer :product_id
      t.string :edition

      t.timestamps
    end
  end
end
