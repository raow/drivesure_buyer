class AddIsDeleteToServices < ActiveRecord::Migration
  def change
  	add_column :services, :is_delete, :boolean
  end
end
