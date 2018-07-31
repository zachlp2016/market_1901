# Market

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
  * Put your name in your PR!

## Iteration 1 - Vendors

The Market will need to keep track of its Vendors. Each Vendor will be able to report its total inventory, stock items, and return the quantity of items. Any item not in stock should return `0` by default. Items will be represented as a String.

Use TDD to create a `Vendor` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/vendor'
#=> true

pry(main)> vendor = Vendor.new("Rocky Mountain Fresh")
#=> #<Vendor:0x00007f85683152f0...>

pry(main)> vendor.name
#=> "Rocky Mountain Fresh"

pry(main)> vendor.inventory
#=> {}

pry(main)> vendor.check_stock("Peaches")
#=> 0

pry(main)> vendor.stock("Peaches", 30)
#=> 30

pry(main)> vendor.check_stock("Peaches")
#=> 30

pry(main)> vendor.stock("Peaches", 25)
#=> 55

pry(main)> vendor.check_stock("Peaches")
#=> 55

pry(main)> vendor.stock("Tomatoes", 12)
#=> 12

pry(main)> vendor.inventory
#=> {"Peaches"=>55, "Tomatoes"=>12}
```

## Iteration 2 - Market and Vendors

A Market is responsible for keeping track of Vendors. It should have a method called `vendor_names` that returns an array of all the Vendor's names.

Additionally, the Market should have a method called `vendors_that_sell` that takes an argument of an item represented as a String. It will return a list of Vendors that have that item in stock.

Use TDD to create a `Market` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/vendor'
#=> true

pry(main)> require './lib/market'
#=> true

pry(main)> market = Market.new("South Pearl Street Farmers Market")    
#=> #<Market:0x00007fe134933e20...>

pry(main)> market.name
#=> "South Pearl Street Farmers Market"

pry(main)> market.vendors
#=> []

pry(main)> vendor_1 = Vendor.new("Rocky Mountain Fresh")
#=> #<Vendor:0x00007fe1348a1160...>

pry(main)> vendor_1.stock("Peaches", 35)    
#=> 35

pry(main)> vendor_1.stock("Tomatoes", 7)    
#=> 7

pry(main)> vendor_2 = Vendor.new("Ba-Nom-a-Nom")    
#=> #<Vendor:0x00007fe1349bed40...>

pry(main)> vendor_2.stock("Banana Nice Cream", 50)    
#=> 50

pry(main)> vendor_2.stock("Peach-Raspberry Nice Cream", 25)    
#=> 25

pry(main)> vendor_3 = Vendor.new("Palisade Peach Shack")    
#=> #<Vendor:0x00007fe134910650...>

pry(main)> vendor_3.stock("Peaches", 65)    
#=> 65

pry(main)> market.add_vendor(vendor_1)    
#=> [#<Vendor:0x00007fe1348a1160...>]

pry(main)> market.add_vendor(vendor_2)    
#=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe1349bed40...>]

pry(main)> market.add_vendor(vendor_3)    
#=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe1349bed40...>, #<Vendor:0x00007fe134910650...>]

pry(main)> market.vendors
#=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe1349bed40...>, #<Vendor:0x00007fe134910650...>]

pry(main)> market.vendor_names
#=> ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

pry(main)> market.vendors_that_sell("Peaches")
#=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe134910650...>]

pry(main)> market.vendors_that_sell("Banana Nice Cream")
#=> [#<Vendor:0x00007fe1349bed40...>]
```

## Iteration 3 - Items sold at the Market

Add a method to your `Market` class called `sorted_item_list` that returns a list of all items the Vendors have in stock, sorted alphabetically. This list should not include any duplicate items. For instance, if two vendors sell `"Peaches"`, the `sorted_item_list` should only list `"Peaches"` once.

Additionally, your `Market` class should have a method called `total_inventory` that reports the quantities of all items sold at the market. Specifically, it should return a hash with items as keys and quantities as values. If multiple Vendors sell the same item, the quantity listed should be the sum of all the quantities. For instance if one Vendor has 35 `"Peaches"` in stock and another has 65 `"Peaches"` in stock, `total_inventory` should list the key of `"Peaches"` with the value `100`.

Use TDD to update your `Market` class so that it responds to the following interaction pattern:

```ruby
pry(main)> require './lib/vendor'
#=> true

pry(main)> require './lib/market'
#=> true

pry(main)> market = Market.new("South Pearl Street Farmers Market")    
#=> #<Market:0x00007fe134933e20...>

pry(main)> vendor_1 = Vendor.new("Rocky Mountain Fresh")
#=> #<Vendor:0x00007fe1348a1160...>

pry(main)> vendor_1.stock("Peaches", 35)    
#=> 35

pry(main)> vendor_1.stock("Tomatoes", 7)    
#=> 7

pry(main)> vendor_2 = Vendor.new("Ba-Nom-a-Nom")    
#=> #<Vendor:0x00007fe1349bed40...>

pry(main)> vendor_2.stock("Banana Nice Cream", 50)    
#=> 50

pry(main)> vendor_2.stock("Peach-Raspberry Nice Cream", 25)    
#=> 25

pry(main)> vendor_3 = Vendor.new("Palisade Peach Shack")    
#=> #<Vendor:0x00007fe134910650...>

pry(main)> vendor_3.stock("Peaches", 65)    
#=> 65

pry(main)> market.add_vendor(vendor_1)    
#=> [#<Vendor:0x00007fe1348a1160...>]

pry(main)> market.add_vendor(vendor_2)    
#=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe1349bed40...>]

pry(main)> market.add_vendor(vendor_3)    
#=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe1349bed40...>, #<Vendor:0x00007fe134910650...>]

pry(main)> market.sorted_item_list
#=> ["Banana Nice Cream", "Peach-Raspberry Nice Cream", "Peaches", "Tomatoes"]

pry(main)> market.total_inventory
#=> {"Peaches"=>100, "Tomatoes"=>7, "Banana Nice Cream"=>50, "Peach-Raspberry Nice Cream"=>25}
```

## Iteration 4 - Selling Items

Add a method to your Market class called `sell` that takes an item and a quantity as arguments. There are two possible outcomes of the `sell` method:

1. If the Market does not have enough of the item in stock to satisfy the given quantity, this method should return `false`.

2. If the Market's has enough of the item in stock to satisfy the given quantity, this method should return `true`. Additionally, this method should reduce the stock of the Vendors. It should look through the Vendors in the order they were added and sell the item from the first Vendor with that item in stock. If that Vendor does not have enough stock to satisfy the given quantity, the Vendor's entire stock of that item will be depleted, and the remaining quantity will be sold from the next vendor with that item in stock. It will follow this pattern until the entire quantity requested has been sold.

For example, suppose vendor_1 has 35 `"Peaches"` and vendor_3 has 65 `"Peaches"`, and vendor_1 was added to the market first. If the method `sell("Peaches", 40)` is called, the method should return `true`, vendor_1's new stock of `"Peaches"` should be 0, and vendor_3's new stock of `"Peaches"` should be 60.

Use TDD to update the `Market` class so that it responds to the following interaction pattern:

```ruby
pry(main)> require './lib/vendor'
#=> true

pry(main)> require './lib/market'
#=> true

pry(main)> market = Market.new("South Pearl Street Farmers Market")    
#=> #<Market:0x00007fe134933e20...>

pry(main)> vendor_1 = Vendor.new("Rocky Mountain Fresh")
#=> #<Vendor:0x00007fe1348a1160...>

pry(main)> vendor_1.stock("Peaches", 35)    
#=> 35

pry(main)> vendor_1.stock("Tomatoes", 7)    
#=> 7

pry(main)> vendor_2 = Vendor.new("Ba-Nom-a-Nom")    
#=> #<Vendor:0x00007fe1349bed40...>

pry(main)> vendor_2.stock("Banana Nice Cream", 50)    
#=> 50

pry(main)> vendor_2.stock("Peach-Raspberry Nice Cream", 25)    
#=> 25

pry(main)> vendor_3 = Vendor.new("Palisade Peach Shack")    
#=> #<Vendor:0x00007fe134910650...>

pry(main)> vendor_3.stock("Peaches", 65)    
#=> 65

pry(main)> market.add_vendor(vendor_1)    
#=> [#<Vendor:0x00007fe1348a1160...>]

pry(main)> market.add_vendor(vendor_2)    
#=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe1349bed40...>]

pry(main)> market.add_vendor(vendor_3)    
#=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe1349bed40...>, #<Vendor:0x00007fe134910650...>]

pry(main)> market.sell("Peaches", 200)
#=> false

pry(main)> market.sell("Onions", 1)
#=> false

pry(main)> market.sell("Banana Nice Cream", 5)
#=> true

pry(main)> vendor_2.check_stock("Banana Nice Cream")
#=> 45

pry(main)> market.sell("Peaches", 40)
#=> true

pry(main)> vendor_1.check_stock("Peaches")
#=> 0

pry(main)> vendor_3.check_stock("Peaches")
#=> 60
```
