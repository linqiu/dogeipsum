# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dogeipsum/version'

Gem::Specification.new do |spec|
  spec.name          = "dogeipsum"
  spec.version       = DogeIpsum::VERSION
  spec.authors       = ["Lin Qiu"]
  spec.email         = ["theonlylinqiu@gmail.com"]
  spec.description   = %q{ wow such generate! }
  spec.summary       = %q{ many ipsum! such generate! }
  spec.homepage      = "https://github.com/linqiu/dogeipsum"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
