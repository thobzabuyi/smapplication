class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :sec_code
      t.string :name
      t.string :desc
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
