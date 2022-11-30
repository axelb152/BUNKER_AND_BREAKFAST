class AddFieldsToBunkers < ActiveRecord::Migration[7.0]
  def change
    add_column :bunkers, :bedroom, :integer
    add_column :bunkers, :bed, :integer
    add_column :bunkers, :bathroom, :integer
    add_column :bunkers, :category, :string
  end
end
