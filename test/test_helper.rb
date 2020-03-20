require 'simplecov'
SimpleCov.start 'rails' do
  filters.clear # This will remove the :root_filter and :bundler_filter that come via simplecov's defaults
  add_filter /vendor/
  add_filter /config/
  add_filter 'app/channels'
  add_filter 'app/mailers'
  add_filter 'app/jobs'
  add_filter 'app/helpers'
  add_filter 'app/controllers/coverages_controller.rb'
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group "Services", 'app/services'
end
SimpleCov.root("public")
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  include FactoryBot::Syntax::Methods

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
