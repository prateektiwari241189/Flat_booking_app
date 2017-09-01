class CreateFlatBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :flat_bookings do |t|
    	t.column :title, :string, :limit => 32, :null => false
        t.column :base_price, :float
        t.column :agreement_amount, :float
        t.column :area, :float
        t.column :date_of_booking, :timestamp
      	t.timestamps
    end
  end
end
