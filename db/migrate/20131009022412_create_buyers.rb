class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.string :certificate_type
      t.string :certificate_no
      t.boolean :is_caa_vip
      t.string :address
      t.string :zip
      t.string :phone
      t.string :mobile

      t.timestamps
    end
  end
end
