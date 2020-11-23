class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json

  def index
    authorize! :create, Store
    @stores = Store.all
      respond_to do |format| 
        format.html
        format.json {render json: @stores }
    end

  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @sto = @store.sections.joins(groups: :items).select('sections.name as name, SUM(items.profit) as profit').group('sections.id')
    @cost = @store.sections.joins(groups: :items).select('sections.name as name, SUM(items.cost_price) as costs').group('sections.id')
    @sell = @store.sections.joins(groups: :items).select('sections.name as name, SUM(items.sell_price) as selling').group('sections.id')
 
    @opening = @store.sections.joins(groups: :items).select('sections.name as name, SUM(items.open_stck) as open_stock').group('sections.id')
    @closing = @store.sections.joins(groups: :items).select('sections.name as name, SUM(items.clasing_stock) as closing_stock').group('sections.id')
    @sold = @store.sections.joins(groups: :items).select('sections.name as name, SUM(items.sold_stock) as sold_stock').group('sections.id')

    @sec_group = @store.sections.joins(groups: :items).select('sections.name as name, COUNT(items.item_name) as sec_name, COUNT(groups.name) as group_name').group('sections.id')
  respond_to do |format| 
    format.html
        format.json { render json: @sec_group }
  end

  end

  # GET /stores/new
  def new
    authorize! :create, Store
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end



  # POST /stores
  # POST /stores.json
  def create
    authorize! :create, Store
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    authorize! :create, Store
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:storereg_no, :name, :address, :contact)
    end
end
