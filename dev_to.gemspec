
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dev_to/version"

Gem::Specification.new do |spec|
  spec.name          = "dev_to"
  spec.version       = DevTo::VERSION
  spec.authors       = ["PRbsas"]
  spec.email         = ["paularamirez0316@gmail.com"]

  spec.summary       = %q{Get Posts from The DEV Community}
  spec.description   = %q{Get Posts from dev.to}
  spec.homepage      = "https://github.com/PRbsas/devto-cli-gem"
  spec.license       = "MIT"

  spec.executables   << 'devto'
  spec.require_paths = ["lib/dev_to.rb, config/environment.rb"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", "~> 1.6", ">= 1.6.8"
  spec.add_development_dependency "pry", "~> 0.11.2"
  spec.add_dependency "colorize", "~> 0.8.1"
end
