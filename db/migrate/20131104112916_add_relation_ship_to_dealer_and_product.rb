class AddRelationShipToDealerAndProduct < ActiveRecord::Migration
  def change
  	create_table :dealers_products do |t|
      t.belongs_to :product
      t.belongs_to :dealer

    end

      Product.unscoped.all.each do |pro|
      	Dealer.unscoped.all.each do |dealer|
      		pro.dealers << dealer
      	end
      end
  end
end
