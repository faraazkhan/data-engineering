class Item < ActiveRecord::Base
  #schema
  #id: integer
  #description: string
  #price: decimal
  #created_at: datetime
  #updated_at: datetime
  has_many :purchases
end
