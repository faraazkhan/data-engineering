class User < ActiveRecord::Base
  #schema
  #id: integer
  #name: string
  #identity_url: string
  #created_at: datetime
  #updated_at: datetime
  #remember_token: string
  validates_uniqueness_of :remember_token, :identity_url

  before_create :set_remember_token

  protected
  def set_remember_token
    self.remember_token = loop do
      token = SecureRandom.urlsafe_base64(nil, false)
      break token unless self.class.exists?(remember_token: token)
    end
  end

end
