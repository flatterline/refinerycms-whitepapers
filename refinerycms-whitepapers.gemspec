# Encoding: UTF-8
Gem::Specification.new do |s|
  s.authors           = ['Curtis Miller', 'Chris Irish']
  s.description       = 'Handles attaching a file to a page as a whitepaper.'
  s.name              = 'refinerycms-whitepapers'
  s.platform          = Gem::Platform::RUBY
  s.require_paths     = %w(lib)
  s.summary           = 'Whitepapers extension for Refinery CMS'
  s.version           = '1.0'

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  # Runtime dependencies
  s.add_dependency 'refinerycms-core', '~> 2.0.10'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.10'
end
