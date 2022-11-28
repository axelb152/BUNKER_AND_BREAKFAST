class CreateBunkers < ActiveRecord::Migration[7.0]
  def change
    create_table :bunkers do |t|

      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :price
      t.string :location
      t.integer :max_capacity

      t.timestamps
    end
  end
end
