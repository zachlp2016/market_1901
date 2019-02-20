class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.empty? == true
      return item = 0
    end
    @inventory.each do |goods|
      if goods[0] == item
        return goods[1]
        if goods.empty? == true
          item = 0
        end
      end
    end
  end

  def stock(item, count)
    if @inventory[item] == nil
      return @inventory[item] = count
    end
    @inventory.each do |goods|
      if item == goods[0]
        @inventory[goods[0]] += count
      end
    end
  end
end
