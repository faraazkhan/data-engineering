require 'spec_helper'

describe Merchant do
  it { should have_many(:sales) }
end
