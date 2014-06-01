require "minitest/power_assert/version"

require 'minitest'
require 'power_assert'

module Minitest
  module PowerAssert
    module Assertions
      def power_assert(&blk)
        ::PowerAssert.start(blk, assertion_method: __method__) do |pa|
          assert pa.yield, pa.message_proc
        end
      end
    end
  end

  class Test
    include PowerAssert::Assertions
  end
end
