class Record < ApplicationRecord
  belongs_to :item
  belongs_to :store
  before_update :val

def val
  items = Item.find(self.item_id)
  items.qualntity = items.qualntity + self.quantity.to_i
items.save
end
end
