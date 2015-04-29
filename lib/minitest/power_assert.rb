require "minitest/power_assert/version"

require 'minitest'
require 'power_assert'

module Minitest
  module PowerAssert
    module Assertions
      def assert(test = nil, msg = nil)
        if block_given?
          ::PowerAssert.start(Proc.new, assertion_method: __method__) do |pa|
            super pa.yield, pa.extend(ContextExtension)
          end
        else
          super
        end
      end

      def refute(test = nil, msg = nil)
        if block_given?
          ::PowerAssert.start(Proc.new, assertion_method: __method__) do |pa|
            super pa.yield, pa.extend(ContextExtension)
          end
        else
          super
        end
      end


      module ContextExtension
        def to_s
          message
        end
      end
      private_constant :ContextExtension

    end
  end

  class Test
    include PowerAssert::Assertions
  end
end
