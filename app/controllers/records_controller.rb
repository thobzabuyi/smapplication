class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    store = Store.find(params[:store_id])
    @records = store.records.page(params[:page]).per_page(15).order("created_at DESC")
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @store = Store.find(params[:store_id])
    @itemm = @store.sections.select("items.item_name as name,items.id as id")
        .joins(groups: :items)
        .group("items.id")
        @groupp = @store.sections.select("groups.name as name")
        .joins(groups: :items)
        .group("groups.id")
    @record = @store.records.build
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @store = Store.find(params[:store_id])
    @record = @store.records.create(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to store_records_path }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to store_records_path(@record.store) }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to store_records_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      store = Store.find(params[:store_id])
      @record = store.records.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:store, :section, :group, :quantity, :item_id, :store_id)
    end
end
