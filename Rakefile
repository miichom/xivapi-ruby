# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new(:standard) do |task|
  task.options = ["--require", "standard", "--format", "progress"]
end

task default: %i[spec standard]
