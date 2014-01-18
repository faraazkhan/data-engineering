class InvalidHeadersError < StandardError; end
require "csv"
class DataImport < ActiveRecord::Base
  #schema
  #id: integer
  #filename: string
  #rows: integer
  #purchases: integer

  EXPECTED_HEADERS = ["purchaser name","item description","item price","purchase count","merchant address","merchant name"]
  DELIMITER = "\t"
  class << self
    def process(file)
      @file = file
      @total_revenue = 0
      @total_purchase_count = 0
      parsed_file.each do |row|
        create_purchases_from row
      end
      create(:filename => file.original_filename, :rows => @csv.count, :purchases => @total_purchase_count, :total_revenue => @total_revenue ) 
    end
    protected
    def parsed_file
      @csv = CSV.read(@file.path, { :col_sep => DELIMITER, :headers => true })
      raise InvalidHeadersError unless valid_headers?
      @csv
    end

    def create_purchases_from(row)
      purchaser, merchant, item = process_row(row)
      purchase_count = row[3].to_i #assuming its always valid data for simplicity
      @total_purchase_count += purchase_count
      purchase_count.times do
        Purchase.create(:purchaser => purchaser, :merchant => merchant, :item => item)
        @total_revenue += item.price
      end
    end

    def valid_headers?
      @csv.headers == EXPECTED_HEADERS
    end

    def process_row(row)
      [purchaser_from(row),
       merchant_from(row),
       item_from(row)]
    end

    def purchaser_from(row)
      #row[0] is always purchaser name
      Purchaser.find_or_create_by(name: row[0])
    end

    def merchant_from(row)
      #row[5] is always merchant name
      #row[4] is always merchant address
      merchant = Merchant.find_or_create_by(name: row[5])
      merchant.update_attribute(:address, row[4]) #assuming there is always only one Merchant with a given name for simplicity
      merchant
    end

    def item_from(row)
      #row[1] is always item description
      item = Item.find_or_create_by(description: row[1])
      item.update_attribute(:price, row[2]) # assuming only one item with a given description, price is overwritten with next import for same item
      item
    end
  end


end
