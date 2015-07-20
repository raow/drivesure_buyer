class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :phone
      t.string :mobile
      t.string :certificate_type
      t.string :certificate_no
      t.string :company_code
      t.string :address
      t.belongs_to :car
      t.timestamps
    end
  end
end
