# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# added logger
Rails.logger = Logger.new(STDOUT)
