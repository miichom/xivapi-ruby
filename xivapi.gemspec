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

  spec.require_paths = ["lib"]
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.add_dependency "net-http", "~> 0.9.1"
  spec.metadata["rubygems_mfa_required"] = "true"
end
