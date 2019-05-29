class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(food)
    here = []
    @vendors.each do |vendor|
      if vendor.inventory.keys.include?(food)
        here << vendor
      end
    end
    here
  end

  def sorted_item_list
    items = []
    @vendors.each do |vendor|
      vendor.inventory.map do
        items << vendor.inventory.keys
      end
    end
    items.flatten.sort.uniq
  end

  def total_inventory
    total = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.find_all do |food, amount|
        total[food] += amount
      end
    end
    total
  end
end
