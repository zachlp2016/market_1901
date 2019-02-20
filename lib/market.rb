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
    vendor_name_arr = []
    @vendors.each do |vendor|
      vendor_name_arr << vendor.name
    end
    return vendor_name_arr
  end

  def vendors_that_sell(item)
    vendors_that_sell_arr = []
    @vendors.each do |vendor|
      vendor.inventory.each do |inventory|
        if inventory[0] == item
          vendors_that_sell_arr << vendor
        end
      end
    end
    return vendors_that_sell_arr
  end

  def sorted_item_list
    sorted_item_list_arr = []
    @vendors.each do |vendor|
      vendor.inventory.each do |inventory|
          sorted_item_list_arr << inventory[0]
      end
    end
    return sorted_item_list_arr.sort.uniq
  end

  def total_inventory
    total_inventory_hash = Hash.new{0}
    @vendors.each do |vendor|
      vendor.inventory.each do |inventory|
        total_inventory_hash[inventory[0]] += inventory[1]
      end
    end
    return total_inventory_hash
  end

  def sell(item, count)
    total_inventory.each do |inventory|
      if inventory[0] == item && inventory[1] >= count
        @vendors.each do |vendor|
          vendor.inventory.each do |inventory|
            if inventory[0] == item
              vendor.inventory[item] = inventory[1] - count
            end
          end
        end
        return true
      end
    end
    return false
  end
end
