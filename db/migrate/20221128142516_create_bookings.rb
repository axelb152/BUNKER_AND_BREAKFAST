class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :bunker, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.float :total_price
      t.string :status
      t.integer :number_of_guests

      t.timestamps
    end
  end
end
