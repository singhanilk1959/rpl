#
# you need to include just minitest/autrorun to run tests

require 'minitest/autorun'
require 'minitest/pride'

# you do not need pride...it is needed to put color in your output

class TestArray < MiniTest::Unit::TestCase
 
# setup is run once at startup and teardown at the end.

  def setup
  end
  def teardown
  end

  def test_array_can_be_created_with_no_arguments
    assert_instance_of Array, Array.new
  end

  def test_array_of_specific_length_can_be_created
    assert_equal 10, Array.new(10).size
  end

end

