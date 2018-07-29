require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class VendorTest < Minitest::Test
  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end

  def test_it_has_a_name
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_inventory_starts_as_empty_hash
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal ({}), vendor.inventory
  end

  def test_it_can_stock_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 24)
    vendor.stock("Peaches", 11)
    vendor.stock("Tomatoes", 10)
    expected = {"Peaches" => 35, "Tomatoes" => 10}
    assert_equal expected, vendor.inventory
  end

  def test_unstocked_items_default_to_zero
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 0, vendor.check_stock("Honey")
  end

  def test_it_can_check_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 24)
    assert_equal 24, vendor.check_stock("Peaches")
  end

  def test_it_can_sell_an_item
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 24)
    vendor.sell("Peaches", 3)
    assert_equal 21, vendor.check_stock("Peaches")
  end

  def test_it_can_sell_its_whole_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 24)
    vendor.sell("Peaches", 30)
    assert_equal 0, vendor.check_stock("Peaches")
  end

  def test_selling_will_return_the_amount_sold
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 24)
    assert_equal 3, vendor.sell("Peaches", 3)
    assert_equal 21, vendor.sell("Peaches", 30)
  end

  # def test_selling_item_returns_true_when_item_is_in_stock
  #   vendor = Vendor.new("Rocky Mountain Fresh")
  #   vendor.stock("Peaches", 24)
  #   assert_equal true, vendor.sell("Peaches", 3)
  # end

  # def test_selling_item_returns_false_when_item_is_not_in_stock
  #   vendor = Vendor.new("Rocky Mountain Fresh")
  #   vendor.stock("Peaches", 24)
  #   assert_equal false, vendor.sell("Peaches", 30)
  # end
  #

  #
  # def test_selling_out_of_stock_item__does_not_reduce_inventory
  #   vendor = Vendor.new("Rocky Mountain Fresh")
  #   vendor.stock("Peaches", 24)
  #   vendor.sell("Peaches", 30)
  #   assert_equal 24, vendor.check_stock("Peaches")
  # end
end
