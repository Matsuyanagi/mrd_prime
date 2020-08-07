require_relative 'lib/mrd_prime/version'

Gem::Specification.new do |spec|
  spec.name          = "mrd_prime"
  spec.version       = MrdPrime::VERSION
  spec.authors       = ["Matsuyanagi"]
  spec.email         = ["1475814+Matsuyanagi@users.noreply.github.com"]

  spec.summary       = %q{A definitive Miller-Rabin prime determination test for small numbers.}
  spec.description   = %q{A definitive Miller-Rabin prime determination test for small numbers (~2^81). For large numbers, fall back to OpenSSL::BN.}
  spec.homepage      = "https://github.com/Matsuyanagi/mrd_prime"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Matsuyanagi/mrd_prime"
  spec.metadata["changelog_uri"] = "https://github.com/Matsuyanagi/mrd_prime"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  
  spec.require_paths = ["lib"]
  spec.add_dependency 'openssl', '~> 2'
end
