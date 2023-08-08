require './lib/item'
require './lib/vendor'
require './lib/market'
require 'pry'

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
  end

  it 'Market exists with no vendors' do
    expect(@market).to be_an_instance_of(Market)
    expect(@market.name).to eq("South Pearl Street Farmers Market")
    expect(@market.vendors).to eq([])
  end
end