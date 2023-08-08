require './lib/item'
require './lib/vendor'
require 'pry'

RSpec.describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it 'Vendor exists with no inventory' do
    expect(@vendor).to be_an_instance_of(Vendor)
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
    expect(@vendor.inventory).to eq({})
  end

  it 'checks vendor stock + adds to stock' do
    expect(@vendor.check_stock(@item1)).to eq(0)

    @vendor.stock(@item1, 30)


    expected_hash = 
    {
      @item1 => 30
    }
    # binding.pry
    expect(@vendor.inventory).to eq(expected_hash)
    expect(@vendor.check_stock(@item1)).to eq(30)

    @vendor.stock(@item1, 25)
    # binding.pry
    expect(@vendor.check_stock(@item1)).to eq(55)

    @vendor.stock(@item2, 12)

    expected_hash = 
    {
      @item1 => 55,
      @item2 => 12
    }
    # binding.pry
    expect(@vendor.inventory).to eq(expected_hash)
  end
end