require './lib/recipe'

class Pantry
  attr_accessor :stock, :shopping_list

  def initialize
    @stock = {}
    @shopping_list = {}
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

  def add_to_shopping_list(recipe)
    check_stock_from_recipe(recipe)
    recipe.ingredients.each do |key, value|
      @shopping_list[key] = value
    end
  end

  def check_stock_from_recipe(recipe)
    numbers = recipe.ingredients.collect do |item, number|
      if stock_check(item) < number
        number = (number - stock_check(item))
      end
    end
    recipe.ingredients.keys.each_with_index do |update, index|
      recipe.ingredients[update] = numbers[index]
    end
  end
end
