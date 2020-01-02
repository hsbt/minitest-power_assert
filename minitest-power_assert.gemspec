# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/power_assert/version'

Gem::Specification.new do |spec|
  spec.name          = "minitest-power_assert"
  spec.version       = Minitest::PowerAssert::VERSION
  spec.authors       = ["SHIBATA Hiroshi"]
  spec.email         = ["hsbt@ruby-lang.org"]
  spec.summary       = %q{Power Assert for Minitest.}
  spec.description   = %q{Power Assert for Minitest.}
  spec.homepage      = "https://github.com/hsbt/minitest-power_assert"
  spec.license       = "2-clause BSDL"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "minitest"
  spec.add_dependency "power_assert", ">= 1.1"

  spec.add_development_dependency "rake"
end
