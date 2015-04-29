require "minitest/power_assert/version"

require 'minitest'
require 'power_assert'

module Minitest
  module PowerAssert
    module Assertions
      def assert test = nil, msg = nil, &blk
        if block_given?
          ::PowerAssert.start(blk, assertion_method: __method__) do |pa|
            # XXX workaround to break inline format with minitest-reporters.
            super pa.yield, "\n#{pa.message_proc.call}"
          end
        else
          super test, msg
        end
      end

      def refute test = nil, msg = nil, &blk
        if block_given?
          ::PowerAssert.start(blk, assertion_method: __method__) do |pa|
            # XXX workaround to break inline format with minitest-reporters.
            super pa.yield, "\n#{pa.message_proc.call}"
          end
        else
          super test, msg
        end
      end
    end
  end

  class Test
    include PowerAssert::Assertions
  end
end
