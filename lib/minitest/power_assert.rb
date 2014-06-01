require "minitest/power_assert/version"

require 'minitest'
require 'power_assert'

module Minitest
  module PowerAssert
    module Assertions
      def power_assert(&blk)
        ::PowerAssert.start(blk, assertion_method: __method__) do |pa|
          prc = pa.message_proc
          class << prc
            alias to_s call
          end
          assert pa.yield, prc
        end
      end
    end
  end

  class Test
    include PowerAssert::Assertions
  end
end
