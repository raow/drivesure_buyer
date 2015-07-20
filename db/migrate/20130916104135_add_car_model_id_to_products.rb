class AddCarModelIdToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :car_model_id, :integer
  end
end
