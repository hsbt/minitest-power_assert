require "minitest/autorun"
require 'minitest/power_assert'

class TestPowerAssert < Minitest::Test
  def test_successful
    power_assert { true }
  end

  def test_failed
    power_assert { "0".class == "3".to_i.times.map {|i| i + 1 }.class }
  end
end
