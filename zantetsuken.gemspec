# frozen_string_literal: true

require_relative 'lib/zantetsuken/version'

Gem::Specification.new do |spec|
  spec.name          = 'zantetsuken'
  spec.version       = Zantetsuken::VERSION
  spec.authors       = ['Simon Fish']
  spec.email         = ['si@mon.fish']

  spec.summary       = "Organize and build your app's Content Security Policy"
  spec.description   = 'The Content Security Policy (CSP) in Rails can get big fast. Slice it up with this gem.'
  spec.homepage      = 'https://github.com/raisedevs/zantetsuken'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/raisedevs/zantetsuken'
  spec.metadata['changelog_uri'] = 'https://github.com/raisedevs/zantetsuken/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'actionpack', '~> 6.1.4', '>= 6.0.0'
  spec.add_runtime_dependency 'activemodel', '~> 6.1.4', '>= 6.0.0'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
