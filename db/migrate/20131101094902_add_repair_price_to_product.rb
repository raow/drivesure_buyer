class AddRepairPriceToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :once_reparation, :string
  	add_column :products, :total_reparation, :string
  end
end
