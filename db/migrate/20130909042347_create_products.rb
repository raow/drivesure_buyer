class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :coverage_period
      t.integer :coverage_mile
      t.string :name

      t.timestamps
    end
  end
end
