require 'simplecov'
SimpleCov.root("#{Rails.root}/public")
SimpleCov.start 'rails' do
    filters.clear
      add_filter do |src|
            !(src.filename =~ /^#{Rails.root}/) unless src.filename =~ /test/
              end
end
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  include FactoryBot::Syntax::Methods
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
