require './lib/recipe'
require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @r_1 = Recipe.new('Cheese Pizza')
    @r_1.add_ingredient('Cheese', 20)
    @r_1.add_ingredient('Flour', 20)
    @r_2 = Recipe.new('Spaghetti')
    @r_2.add_ingredient('Noodles', 10)
    @r_2.add_ingredient('Suace', 10)
    @r_2.add_ingredient('Cheese', 5)
  end

  def test_it_initializes
    assert_instance_of Pantry, @pantry
  end
  
  def test_it_starts_with_no_stock
    assert_instance_of Hash, @pantry.stock
  end

  def test_it_can_check_stock
    assert_equal 0, @pantry.stock_check('Cheese')
  end

  def test_it_can_add_to_stock
    assert_equal 0, @pantry.stock_check('Cheese')
    @pantry.restock('Cheese', 10)
    assert_equal 10, @pantry.stock_check('Cheese')
    @pantry.restock('Cheese', 20)
    assert_equal 30, @pantry.stock_check('Cheese')
  end

  def test_it_can_add_items_from_one_recipe_to_shpping_list
    @pantry.add_to_shopping_list(@r_1)
    assert_instance_of Hash, @pantry.shopping_list
    assert_equal 20, @pantry.shopping_list['Cheese']
    assert_equal 20, @pantry.shopping_list['Flour']
  end

  def test_it_can_add_items_from_two_recipes_to_shopping_list
    @pantry.add_to_shopping_list(@r_1)
    @pantry.add_to_shopping_list(@r_2)
    assert_instance_of Hash, @pantry.shopping_list
    assert_equal 25, @pantry.shopping_list['Cheese']
    assert_equal 10, @pantry.shopping_list['Noodles']
  end

  def test_can_it_print_shopping_list
    @pantry.add_to_shopping_list(@r_1)
    list = "* Cheese: 20\n* Flour: 20\n"

    assert_equal list, @pantry.print_shopping_list
  end

  def test_what_can_i_make
    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)

    r2 = Recipe.new("Pickles")
    r2.add_ingredient("Brine", 10)
    r2.add_ingredient("Cucumbers", 30)

    r3 = Recipe.new("Peanuts")
    r3.add_ingredient("Raw nuts", 10)
    r3.add_ingredient("Salt", 10)

    @pantry.add_to_cookbook(r1)
    @pantry.add_to_cookbook(r2)
    @pantry.add_to_cookbook(r3)

    @pantry.restock("Cheese", 10)
    @pantry.restock("Flour", 20)
    @pantry.restock("Brine", 40)
    @pantry.restock("Cucumber", 40)
    @pantry.restock("Raw nuts", 20)
    @pantry.restock("Salt", 20)

    stuff = ['Pickles', 'Peanuts']

    assert_equal stuff, @pantry.what_can_i_make

  end

end
