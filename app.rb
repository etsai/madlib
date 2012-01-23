require "bundler"
Bundler.require

# Establish Database connection
DataMapper.setup(:default, "sqlite::memory:")
# Load model code
require_relative "models/story"
# Run any database migrations
DataMapper.finalize
DataMapper.auto_upgrade!
