class RemoveColumnToCar < ActiveRecord::Migration
  def change
  	remove_column :cars, :model
  	add_column :cars, :car_model_id, :integer
  end
end
