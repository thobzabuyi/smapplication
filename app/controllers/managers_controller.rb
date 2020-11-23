class ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :edit, :update, :destroy]

  # GET /managers
  # GET /managers.json
  def index
    authorize! :manage, Manager
    store = Store.find(params[:store_id])
    @managers = store.managers.all
  end

  # GET /managers/1
  # GET /managers/1.json
  def show
  end

  # GET /managers/new
  def new
    authorize! :create, Manager
    store = Store.find(params[:store_id])
    @manager = store.managers.build

  end

  # GET /managers/1/edit
  def edit
  end

  # POST /managers
  # POST /managers.json
  def create
    authorize! :create, Manager
    store = Store.find(params[:store_id])
    @manager = store.managers.create(manager_params)

    respond_to do |format|
      if @manager.save
        format.html { redirect_to store_manager_path(@manager.store,@manager) }
        format.json { render :show, status: :created, location: @manager }
      else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managers/1
  # PATCH/PUT /managers/1.json
  def update
    authorize! :update, Manager
    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to store_managers_path }
        format.json { render :show, status: :ok, location: @manager }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managers/1
  # DELETE /managers/1.json
  def destroy
    authorize! :destroy, Manager
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to store_managers_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      store = Store.find(params[:store_id])
      @manager = store.managers.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_params
      params.require(:manager).permit(:fname, :lname, :email, :contact, :role, :address, :username, :password, :password_confirmation, :store_id)
    end
end
