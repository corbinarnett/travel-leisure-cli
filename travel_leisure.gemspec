lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "./lib/travel_leisure/version"

Gem::Specification.new do |spec|
  spec.name          = "travel_leisure"
  spec.version       = TravelLeisure::VERSION
  spec.authors       = ["corbinarnett"]
  spec.email         = ["corbin.c.arnett@gmail.com"]

  spec.summary       = %q{"A ruby gem to display travel guides in your terminal!"}
  spec.description   = %q{"A ruby gem that accesses 'Travel & Leisure' magazine's travel guides"}
  spec.homepage      = "https://github.com/corbinarnett/travel-leisure-cli"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
    spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ['travel_leisure'] #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.4"
  spec.add_dependency "nokogiri", "~> 1.8"
  spec.add_dependency "colorize", "~> 0.8.1"
end