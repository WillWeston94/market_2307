require './lib/item'
require './lib/vendor'
require 'pry'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it 'Vendor exists with no inventory' do
    expect(@vendor).to be_an_instance_of(Vendor)
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
    expect(@vendor.inventory).to eq({})
  end

  it 'checks vendor stock' do
    expect(@vendor.check_stock(@item1)).to eq(0)
  end
end