# frozen_string_literal: true

require_relative "lib/ActiveAdminReports/version"

Gem::Specification.new do |spec|
  spec.name = "ActiveAdminReports"
  spec.version = ActiveAdminReports::VERSION
  spec.authors = %w[harunkumars]
  spec.email = %w[harun@betacraft.io]

  spec.summary = "TBD" #TODO
  spec.description = "TBD" #TODO
  spec.homepage = "https://github.com/harunkumars/ActiveAdminReports" #TODO
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage #TODO
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "activeadmin", ">= 2.7.0"
  spec.add_dependency "activestorage", ">= 6.1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
