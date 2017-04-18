require './lib/recipe'

class Pantry
  attr_accessor :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    item = item.capitalize
    if !stock[item].nil?
      stock[item]
    else
      0
    end
  end

  def restock(item, number)
    item = item.capitalize
    if !stock[item].nil?
      stock[item] = (stock[item] + number)
    else
      stock[item] = number
    end
  end

  def add_to_shopping_list(items)
  end



end
