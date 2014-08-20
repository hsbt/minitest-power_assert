# Minitest::PowerAssert

[![Gem Version](https://badge.fury.io/rb/minitest-power_assert.png)](https://rubygems.org/gems/minitest-power_assert) [![Build Status](https://travis-ci.org/hsbt/minitest-power_assert.png)](https://travis-ci.org/hsbt/minitest-power_assert)

Power Assert for Minitest.

Basic concept is [test-unit-power_assert](https://github.com/k-tsj/test-unit-power_assert).

## Installation

Add this line to your application's Gemfile:

    gem 'minitest-power_assert'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-power_assert

## Usage

see [testcase](https://github.com/hsbt/minitest-power_assert/blob/master/test/test_power_assert.rb)

### Basic Testcase

minitest-power_assert overrides assert method. You can use power_assert by assert with block.

```ruby
class TestPowerAssert < Minitest::Test
  def test_power_assert_failed
    assert { "0".class == "3".to_i.times.map {|i| i + 1 }.class }
  end
end
```

If test is failed, you can see follow message.

```shell
  1) Failure:
TestPowerAssert#test_power_assert_failed [test/test_power_assert.rb:10]:
    assert { "0".class == "3".to_i.times.map {|i| i + 1 }.class }
                 |            |    |     |                |
                 |            |    |     |                Array
                 |            |    |     [1, 2, 3]
                 |            |    #<Enumerator: 3:times>
                 |            3
                 String
```

## Contributing

1. Fork it ( https://github.com/hsbt/minitest-power_assert/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
