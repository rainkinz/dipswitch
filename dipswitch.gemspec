# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dipswitch/version'

Gem::Specification.new do |spec|
  spec.name          = "dipswitch"
  spec.version       = Dipswitch::VERSION
  spec.authors       = ["rainkinz"]
  spec.email         = ["brendan.grainger@gmail.com"]

  spec.summary       = %q{Super simple feature flag toggler}
  spec.description   = %q{Super simple feature flag toggler}
  spec.homepage      = "http://github.com/rainkinz/dipswitch"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  # spec.add_development_dependency "bundler", "~> 2.2.10"
  # spec.add_development_dependency "opal"
end
