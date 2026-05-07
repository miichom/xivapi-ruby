# frozen_string_literal: true

require_relative "lib/xivapi/version"

Gem::Specification.new do |spec|
  spec.name = "xivapi"
  spec.version = XIVAPI::VERSION
  spec.authors = ["Matt Antonelli"]
  spec.email = ["matt@antonelli.dev"]

  spec.summary = "An asynchronous Ruby client gem for working with XIVAPI"
  spec.description = "An asynchronous Ruby client gem for working with XIVAPI"
  spec.homepage = "https://github.com/xivapi/xivapi-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.3.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .rspec spec/ .github/ .rubocop.yml])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "net-http", "~> 0.9.1"
  spec.metadata["rubygems_mfa_required"] = "true"
end
