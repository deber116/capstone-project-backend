class CreateSetGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :set_groups, id: false do |t|
      t.primary_key :group_id
      t.string :name
  

      t.timestamps
    end
  end
end
