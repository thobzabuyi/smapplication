module SessionsHelper
def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= Owner.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = Owner.find_by(id: user_id)
    end

    if (user_id = session[:user_id])
      @current_user ||= Manager.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = Manager.find_by(id: user_id)
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def manager_in?
    current_user.role == 'manager'
  end

  def owner_in?
    current_user.role == 'owner'
  end



   def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
