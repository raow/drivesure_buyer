class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :license_no
      t.string :vin
      t.datetime :purchase_at
      t.decimal :purchase_price
      t.string :ein
      t.string :model
      t.integer :current_mile

      t.timestamps
    end
  end
end
