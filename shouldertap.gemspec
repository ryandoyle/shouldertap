# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shouldertap/version'

Gem::Specification.new do |spec|
  spec.name          = "shouldertap"
  spec.version       = ShoulderTap::VERSION
  spec.authors       = ["Ryan Doyle"]
  spec.email         = ["ryan@doylenet.net"]
  spec.summary       = %q{Get desktop notifications of builds fed by TAP output (Test Anything Protocol)}
  spec.description   = %q{ShoulderTap receives TAP-compliant (http://testanything.org/) output via STDIN and will display pop-up notifications once the test is complete}
  spec.homepage      = "https://github.com/ryandoyle/shouldertap"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "notify"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
