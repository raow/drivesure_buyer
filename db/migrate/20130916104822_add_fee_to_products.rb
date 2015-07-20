class AddFeeToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :fee, :decimal, precision: 10,  scale: 2
  	change_column :services, :total_fee, :decimal, precision: 10, scale: 2
  end
end