class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item].nil?
      0
    else
      @inventory[item]
    end
  end

  def stock(item, amount)
    if @inventory[item].nil?
      @inventory[item] = amount
    elsif
      @inventory[item] = amount + @inventory[item]
    end
  end

  def potential_revenue
    @inventory.each_with_object([]) do |(info, quantity), array|
      array << info.price * quantity
    end.sum
  end
end