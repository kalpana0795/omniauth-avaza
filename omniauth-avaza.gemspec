# frozen_string_literal: true

require_relative 'lib/omniauth/avaza/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-avaza'
  spec.version       = Omniauth::Avaza::VERSION
  spec.authors       = ['Kalpana']

  spec.summary       = 'Omniauth Strategy for Avaza'
  spec.homepage      = 'https://github.com/kalpana0795/omniauth-avaza'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.5.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/kalpana0795/omniauth-avaza'
  spec.metadata['changelog_uri'] = 'https://github.com/kalpana0795/omniauth-avaza/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:spec)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1.2', '< 3'
  spec.add_development_dependency 'rspec', '~> 3.12'
end
