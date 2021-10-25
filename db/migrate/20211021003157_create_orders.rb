class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      # t.references :カラム名 他テーブルから情報を参照. 対応する主キーのレコードが存在しないと保存できない
      t.timestamps
    end
  end
end
