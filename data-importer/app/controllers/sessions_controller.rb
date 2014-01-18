class SessionsController < ApplicationController

  # Open ID Authentication solution inspired by:
  # http://thirstyforcola.wordpress.com/2013/06/30/setting-up-openid-on-rails/
  skip_before_filter :authenticate_user, :only => [:new, :create]

  # seems to be an issue with CSRF and open id...
  # there has to be a better way to do this, this is probably not that secure :)
  skip_before_filter :verify_authenticity_token, :only => :create 
  def new
  end

  def create
    authenticate_with_open_id do |auth, url|
      if auth.successful?
        normalized_url = URI.parse(url).normalize.to_s
        user = User.find_or_create_by(identity_url: normalized_url)
        sign_in user
      else
        render 'new'
      end
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
