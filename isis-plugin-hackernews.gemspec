# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "isis-plugin-hackernews"
  spec.version       = "1.0.0"
  spec.authors       = ["Brendon Rapp"]
  spec.email         = ["brendon@silentgrowl.com"]
  spec.license       = 'MIT'

  spec.summary       = %q{Isis plugin: HackerNews}
  spec.description   = %q{Isis plugin: HackerNews}
  spec.homepage      = "https://github.com/silentgrowl/isis-plugin-hackernews"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ruby-hackernews"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
