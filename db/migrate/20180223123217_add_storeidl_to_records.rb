class AddStoreidlToRecords < ActiveRecord::Migration[5.1]
  def change
    add_reference :records, :store, foreign_key: true
  end
end
