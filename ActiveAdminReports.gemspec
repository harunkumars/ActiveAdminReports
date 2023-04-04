# frozen_string_literal: true

require_relative "lib/ActiveAdminReports/version"

Gem::Specification.new do |spec|
  spec.name = "ActiveAdminReports"
  spec.version = ActiveAdminReports::VERSION
  spec.authors = %w[harunkumars]
  spec.email = %w[harun@betacraft.io]

  spec.summary = "Create and execute Ruby Scripts that have access to Application logic"
  spec.description = "Adds a new resource to ActiveAdmin that allows you to create and execute Ruby Scripts that have
complete access to your application logic.
This is useful for creating reports that might be a little tedious to produce with plain SQL queries.
With access to Models and their associations, you can create reports that are more flexible and easier to maintain."
  spec.homepage = "https://github.com/betacraft/ActiveAdminReports"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/betacraft/ActiveAdminReports/README.md"

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

  spec.add_dependency "activeadmin", ">= 2.7.0"
  spec.add_dependency "activestorage", ">= 6.1.0"
end
