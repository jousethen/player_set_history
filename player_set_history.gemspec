
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "player_set_history/version"

Gem::Specification.new do |spec|
  spec.name          = "player_set_history"
  spec.version       = PlayerSetHistory::VERSION
  spec.authors       = ["'Jouse Then'"]
  spec.email         = ["'jthen93@gmail.com'"]

  spec.summary       = %q{"Retrieves player set history"}
  spec.description   = %q{"Retrieves a player's smash.gg set history and displays it in a CLI. On the back-end, it creates player, sets, tournament objects which can be referenced for more information in the future"}
  spec.homepage      = "https://github.com/jousethen/player_set_history"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
    spec.metadata["homepage_uri"] = spec.homepage

  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "pry"
  spec.add_dependency "httparty"
end
