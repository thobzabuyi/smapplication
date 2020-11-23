class SessionsController < ApplicationController
    
  def new
  end

  def create
    user = Owner.find_by(username: params[:session][:username])
    manager = Manager.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to graph_path
    elsif manager && manager.authenticate(params[:session][:password])
      log_in manager
      redirect_to store_path(manager.store_id)
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
