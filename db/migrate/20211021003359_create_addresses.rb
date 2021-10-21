class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :code,         null: false
      t.integer :area_id,    null: false
      t.string :muni,              null: false
      t.string :address,      null: false
      t.string :building
      t.string :phone,      null: false
      t.references :order ,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
