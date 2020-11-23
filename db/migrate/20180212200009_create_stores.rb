class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :storereg_no
      t.string :name
      t.text :address
      t.string :contact

      t.timestamps
    end
  end
end
