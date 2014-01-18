require 'spec_helper'

describe DataImport do
  before(:all) do
    csv_rows = <<-eos
purchaser name\titem description\titem price\tpurchase count\tmerchant address\tmerchant name
Snake Plissken\t$10 off $20 of food\t10.0\t2\t987 Fake St\tBob's Pizza
Amy Pond\t$30 of awesome for $10\t10.0\t5\t456 Unreal Rd\tTom's Awesome Shop
Marty McFly\t$20 Sneakers for $5\t5.0\t1\t123 Fake St\tSneaker Store Emporium
Snake Plissken\t$20 Sneakers for $5\t5.0\t4\t123 Fake St\tSneaker Store Emporium
    eos

    file = Tempfile.new('new_purchases.csv')
    file.write(csv_rows)
    file.rewind
    file.stub(:original_filename).and_return('new_purchases.csv')
    @import = DataImport.process file
  end

  it "should correctly import all rows of a valid file" do
    @import.rows.should == 4
  end

  it "should correctly create 12 purchases" do
    Purchase.count.should == 12
  end

  it "should correctly create 3 items" do
    Item.count.should == 3
  end

  it "should correctly create 3 merchants" do
    Merchant.count.should == 3
  end

  it "should correctly calculate the total gross revenue" do
    @import.total_revenue.should == 95.0
  end

  it "should correctly store the number of purchases" do
    @import.purchases.should == 12
  end

end

