class Merchant < ActiveRecord::Base
  #schema
  #id: integer
  #name: string
  #address: string
  #created_at: datetime
  #updated_at: datetime
  has_many :sales, :foreign_key => 'merchant_id', :class_name => "Purchase"

end
