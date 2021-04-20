class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def inventory(food_truck)
    food_truck.inventory
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      inventory(food_truck).include?(item)
    end
  end

  def find_all_items
    @food_trucks.flat_map do |food_truck|
      food_truck.inventory.flat_map do |item|
        item
      end
    end.uniq
  end

  def total_inventory_hash
    items_array = Hash.new
    items_array.each_with_object({}) do |item, hash|
      require 'pry'; binding.pry
      hash[item] = Hash.new
    end
  end

  def total_inventory
    require 'pry'; binding.pry
    total_inventory = {}
    total = @food_trucks.each_with_object({}) do |food_truck, hash|
      hash.merge!(food_truck.inventory) do |item, quantity, new_q|
        total_inventory[item] = hash[:quantity] = quantity + new_q
      end
    end
  end
end