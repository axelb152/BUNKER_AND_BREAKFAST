class PhotoUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :photo_url, :string
  end
end
