class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :telephone

      t.timestamps
    end
  end
end
