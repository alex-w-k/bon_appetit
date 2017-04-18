class Pantry
  attr_accessor :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    if !stock[item].nil?
      stock[item]
    else
      0
    end
  end

  def restock(item, number)
    if !stock[item].nil?
      stock[item] = (stock[item] + number)
    else
      stock[item] = number
    end
  end



end
