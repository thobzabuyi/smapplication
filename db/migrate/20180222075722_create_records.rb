class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :store
      t.string :section
      t.string :group
      t.integer :quantity
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
