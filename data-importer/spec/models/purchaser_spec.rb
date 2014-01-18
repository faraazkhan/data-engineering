require 'spec_helper'

describe Purchaser do
  it { should have_many(:purchases) }
end
