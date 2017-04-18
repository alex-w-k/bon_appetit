require 'pry'
require './lib/recipe'

class Pantry
  attr_reader :stock, :shopping_list, :cook_book

  def initialize
    @stock         = {}
    @shopping_list = {}
    @cook_book     = {}
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
      key = key.capitalize
      if !shopping_list[key].nil?
        shopping_list[key] = (shopping_list[key] + value)
      else
        shopping_list[key] = value
      end
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

  def print_shopping_list
    list = ''
    shopping_list.each do |item, number|
      list << "* #{item}: #{number}\n"
    end
    list
  end

  def add_to_cookbook(recipe)
    @cook_book[recipe.name] = recipe.ingredients
  end

  def what_can_i_make
    ingredients = @cook_book.values
    recipes = []
    ingredients.each do |key, values|
    end
  end
end
