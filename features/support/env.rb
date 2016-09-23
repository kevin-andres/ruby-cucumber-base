require 'hash-to-ostruct'
require 'rspec/expectations'
require './dsl/domain_specific_language'
require 'headless'

World(RSpec::Matchers)

if ENV['HEADLESS'] == 'true'
  require 'headless'

  headless = Headless.new
  headless.start

  at_exit do
    headless.destroy
  end
end

app = DSL::DomainSpecificLanguage.new

Before do
  @app = app
end

at_exit do
  app.quit
end
