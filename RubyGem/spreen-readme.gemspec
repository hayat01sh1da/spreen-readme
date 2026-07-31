# frozen_string_literal: true

require_relative 'lib/spreen_readme/version'

Gem::Specification.new do |spec|
  spec.name    = 'spreen-readme'
  spec.version = SpreenReadme::VERSION
  spec.authors = ['hayat01sh1da']

  spec.summary     = 'Spreen your README: keep README.md up to date from the repository it documents.'
  spec.description = "Spreen — the falcon's stoop, then the preen. Updates a repository's README.md " \
                     'via the readme-update CLI, so the documentation stays in step with the sources ' \
                     'it describes.'
  spec.homepage = 'https://github.com/hayat01sh1da/spreen-readme'
  spec.license  = 'MIT'
  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri']          = spec.homepage
  spec.metadata['source_code_uri']       = spec.homepage
  spec.metadata['changelog_uri']         = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.metadata['bug_tracker_uri']       = "#{spec.homepage}/issues"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files         = Dir['exe/*', 'lib/**/*.rb', 'sig/**/*.rbs', 'README.md', 'LICENSE.txt']
  spec.bindir        = 'exe'
  spec.executables   = ['readme-update']
  spec.require_paths = ['lib']
end
