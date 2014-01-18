module SessionsHelper
  def sign_in(user)
    self.current_user = user
    cookies.signed[:auth_token] = user.remember_token
    redirect_to root_path
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token cookies.signed[:auth_token]
  end

  def logout
    cookies.delete :auth_token
    self.current_user = nil
  end
end
