class Purchaser < ActiveRecord::Base
  #schema:
  #id: integer
  #name: string
  #created_at: datetime
  #updated_at: datetime 

  has_many :purchases
end
