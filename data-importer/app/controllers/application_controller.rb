class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user
  include SessionsHelper

  private
  def authenticate_user
    redirect_to new_session_path unless signed_in?
  end
end
