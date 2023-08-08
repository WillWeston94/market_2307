class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendor_names = []
    @vendors.each do |vendor|
      vendor_names << vendor.name
    end
    vendor_names
  end

  def vendors_that_sell(item)
    vendors_that_sell = []
    @vendors.each do |vendor|
      if vendor.inventory.include?(item)
        vendors_that_sell << vendor
      end
    end
    vendors_that_sell
  end
  # return array
  def sorted_item_list
    items = @vendors.flat_map do |vendor| 
      vendor.inventory.keys 
    end
    items = items.uniq 
    sorted_items = items.sort_by do |item|
      item.name 
    end
    sorted_item_list = sorted_items.map do |item|
      item.name 
    end
    sorted_item_list
  end

  #return a hash
  def total_inventory
    inventory = Hash.new 

    @vendors.each do |vendor|
      @vendor.inventory.each do |item, quantity|
        inventory[item][:quantity] += quanity
        inventory[item][:vendors] << vendor
      end
    end
    inventory
  end

  # return array of item objects
  def overstocked_items
  end
end