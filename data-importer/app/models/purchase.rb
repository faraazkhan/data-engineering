class Purchase < ActiveRecord::Base
  #schema:
  #id: integer
  #purchaser_id: integer
  #item_id: integer
  #merchant_id: integer
  #created_at: datetime
  #updated_at: datetime

  belongs_to :item
  belongs_to :merchant
  belongs_to :purchaser

end
