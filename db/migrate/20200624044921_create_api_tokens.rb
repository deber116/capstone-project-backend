class CreateApiTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :api_tokens do |t|
      t.string :token
      t.string :expiration_date
      t.timestamps
    end
  end
end
