require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
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


end
