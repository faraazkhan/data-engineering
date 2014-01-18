require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "redirects to the root path when successful" do
      post 'create', openid_identifier: 'https://www.google.com/'
      response.should redirect_to root_path
    end

  end

  describe "DELETE 'destroy'" do
    it "redirects to the login page" do
      delete 'destroy'
      response.should redirect_to new_session_path
    end

    it "should delete the auth_token cookie" do
      CGI::Cookie.new('auth_token', "SomeAmazingCookie")
      delete 'destroy'
      request.cookies[:auth_token].should be_nil
    end
  end


end
