
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dev_to/version"

Gem::Specification.new do |spec|
  spec.name          = "dev_to"
  spec.version       = DevTo::VERSION
  spec.authors       = ["PRbsas"]
  spec.email         = ["paularamirez0316@gmail.com"]

  spec.summary       = %q{Get Posts in yout CLI from The DEV Community}
  spec.description   = %q{Application that provides a Command Line Interface (CLI) to read Posts from The DEV Community, https://dev.to/}
  spec.homepage      = "https://github.com/PRbsas/devto-cli-gem"
  spec.license       = "MIT"
  
  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   << 'devto'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", "~> 1.6", ">= 1.6.8"
  spec.add_development_dependency "pry", "~> 0.11.2"
  spec.add_dependency "colorize", "~> 0.8.1"
end
