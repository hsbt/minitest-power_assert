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

  class AliasTest < Minitest::Test
    alias assert_not refute

    def test_power_alias
      assert_not { false }
    end

    def test_power_alias_failed
      assert_not { "0".class == String }
    rescue Minitest::Assertion => e
      assert_match(/String/, e.message)
      assert_match(/assert_not/, e.message)
    end

    def test_alias
      assert_not false
    end

    def test_alias_failed
      assert_not "0".class == String
    rescue Minitest::Assertion => e
      assert_match(/Expected true to not be truthy./, e.message)
    end
  end

  class AliasMethodTest < Minitest::Test
    alias_method :assert2, :assert

    def test_power_alias_method
      assert2 { true }
    end

    def test_power_alias_method_failed
      assert2 { "0".class == Integer }
    rescue Minitest::Assertion => e
      assert_match(/Integer/, e.message)
      assert_match(/assert2/, e.message)
    end

    def test_alias_method
      assert2 true
    end

    def test_alias_method_failed
      assert2 "0".class == Integer
    rescue Minitest::Assertion => e
      assert_match(/Expected false to be truthy./, e.message)
    end
  end
end
