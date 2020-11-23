class DashboardsController < ApplicationController
  def graph
   	@sto = Store.joins(sections: [{ groups: :items }]).select('stores.name as name, SUM(items.profit) as profit').group('stores.id')
    @cost = Store.joins(sections: [{ groups: :items }]).select('stores.name as name, SUM(items.cost_price) as costs').group('stores.id')
    @sell = Store.joins(sections: [{ groups: :items }]).select('stores.name as name, SUM(items.sell_price) as selling').group('stores.id')
 
    @opening = Store.joins(sections: [{ groups: :items }]).select('stores.name as name, SUM(items.open_stck) as open_stock').group('stores.id')
    @closing = Store.joins(sections: [{ groups: :items }]).select('stores.name as name, SUM(items.clasing_stock) as closing_stock').group('stores.id')
    @sold = Store.joins(sections: [{ groups: :items }]).select('stores.name as name, SUM(items.sold_stock) as sold_stock').group('stores.id')
  end

    def stocklist
    @items = Item.all.page(params[:page]).per_page(15).order("created_at DESC")
  end
end
