class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :brand_name
      t.integer :qualntity
      t.integer :open_stck
      t.integer :clasing_stock
      t.decimal :cost_price
      t.decimal :sell_price
      t.decimal :profit
      t.integer :sold_stock
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
