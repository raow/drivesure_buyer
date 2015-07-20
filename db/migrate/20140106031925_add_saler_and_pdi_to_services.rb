class AddSalerAndPdiToServices < ActiveRecord::Migration
  def change
  	add_column :services, :saler, :string
  	add_column :services, :pdi, :string
  end
end
