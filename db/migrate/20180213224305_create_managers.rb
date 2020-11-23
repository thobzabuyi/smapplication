class CreateManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :managers do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :contact
      t.string :role
      t.text :address
      t.string :username
      t.string :password_digest
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
