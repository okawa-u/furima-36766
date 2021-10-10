class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :category_id
      t.integer :state_id 
      t.integer :fee_id 
      t.integer :area_id 
      t.integer :days_id 
      t.integer :price_id 
      t.references :user
      t.timestamps
    end
  end
end
