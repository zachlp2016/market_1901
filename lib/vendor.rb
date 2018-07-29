class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @inventory = Hash.new(0)
    @name = name
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def check_stock(item)
    @inventory[item]
  end

  def sell(item, quantity)
    if check_stock(item) < quantity
      amount_to_sell = check_stock(item)
    else
      amount_to_sell = quantity
    end
    @inventory[item] -= amount_to_sell
    return amount_to_sell
  end
end
