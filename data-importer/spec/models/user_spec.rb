require 'spec_helper'

describe User do
  it "should always have a remember token" do
    user = User.create!(:identity_url => 'http://openid.com/myidentity')
    user.remember_token.should_not be_nil
  end

  it { should validate_uniqueness_of(:remember_token) }
  it { should validate_uniqueness_of(:identity_url) }
end
