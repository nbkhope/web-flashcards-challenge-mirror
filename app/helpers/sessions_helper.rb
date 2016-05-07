helpers do
  def current_user
    @current_user ||= User.find_by(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end
end
