class AddDealerToUser < ActiveRecord::Migration
  def change
    add_column :users, :dealer_id, :integer
  end
end
