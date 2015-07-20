class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :total_fee
      t.datetime :issue_at
      t.datetime :start_at
      t.datetime :end_at
      t.string :no
      t.integer :car_id
      t.integer :product_id
      t.integer :dealer_id
      t.timestamps
    end
  end
end
