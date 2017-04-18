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
  end


end
