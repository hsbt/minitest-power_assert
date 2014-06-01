require "minitest/autorun"
require 'minitest/power_assert'

class TestPowerAssert < Minitest::Test
  def test_successful
    assert { true }
  end

  def test_failed
    assert { "0".class == "3".to_i.times.map {|i| i + 1 }.class }
  end

  def test_assert
    assert true
  end

  def test_assert_fail
    assert "0".class == "3".to_i.times.map {|i| i + 1 }.class
  end
end
