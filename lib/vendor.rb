class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(food)
    @inventory.each do |food, amount|
      inventory[food] = amount
    end
    @inventory[food]
  end

  def stock(food, amount)
    @inventory[food] += amount
  end

end
