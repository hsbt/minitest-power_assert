require 'minitest'
require "minitest/autorun"
require 'minitest/power_assert'

class TestPowerAssert < Minitest::Test
  def test_power_assert
    assert { true }
  end

  def test_power_assert_failed
    assert { "0".class == "3".to_i.times.map {|i| i + 1 }.class }
  rescue Minitest::Assertion => e
    assert_match(/Array/, e.message)
    assert_match(/\[1, 2, 3\]/, e.message)
    assert_match(/#<Enumerator: 3:times>/, e.message)
    assert_match(/String/, e.message)
  end

  def test_assert
    assert true
  end

  def test_assert_failed
    assert "0".class == "3".to_i.times.map {|i| i + 1 }.class
  rescue Minitest::Assertion => e
    assert_match(/Expected false to be truthy./, e.message)
  end

  def test_power_refute
    refute { false }
  end

  def test_power_refute_failed
    refute { "0".class == String }
  rescue Minitest::Assertion => e
    assert_match(/String/, e.message)
  end

  def test_refute
    refute false
  end

  def test_refute_failed
    refute "0".class == String
  rescue Minitest::Assertion => e
    assert_match(/Expected true to not be truthy./, e.message)
  end
end
