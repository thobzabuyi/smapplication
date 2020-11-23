class Item < ApplicationRecord
  belongs_to :group
  has_many :records
  before_update :populate_database
  validates :item_name, :brand_name,:cost_price, :sell_price, :qualntity,  presence: true

  def populate_database
    item = Item.new
    item.profit.to_i
    self.profit = (self.sell_price - self.cost_price)
    self.open_stck = (self.qualntity.to_i + self.open_stck.to_i)
    self.sold_stock = (self.open_stck.to_i - self.clasing_stock.to_i)
  end
end
