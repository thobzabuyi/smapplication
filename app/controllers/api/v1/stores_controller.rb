module Api
  module V1
    class StoresController < ApplicationController
   
      respond_to? :json
      
      def index
        render json: Store.all
      end
      
      def show
         sellit = Array.new
        @store = Store.find(params[:id])
        @sell = @store.sections.select("sections.updated_at as datec, SUM(items.sell_price) as selling,SUM(items.cost_price) as cost ")
        .joins(groups: :items)
        .group("sections.id")

    @sell.each do |sell|
      sellit << [sell.datec.to_formatted_s(:long),sell.selling.to_i,sell.cost.to_d]
    end
       # @store = Store.find(params[:id])
        #@sell = @store.sections.joins(groups: :items).select('sections.created_at as datec, SUM(items.sell_price) as selling').group('sections.id')
        render json: sellit, callback: params['callback']
      end
      
      def create
        respond_with Store.create(store_params)
      end
      
      def update
        respond_with Store.update(store_params)
      end
      
      def destroy
        respond_with Store.destroy(params[:id])
      end

      private
      def store_params
         params.require(:store).permit(:storereg_no, :name, :address, :contact)
      end

      def set_store
      @store = Store.find(params[:id])
    end
    end
  end
end