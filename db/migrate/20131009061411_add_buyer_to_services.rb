class AddBuyerToServices < ActiveRecord::Migration
  def change
  	add_column :services, :buyer_id, :integer
  end
end
