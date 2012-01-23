require "bundler"
Bundler.require

# Establish Database connection
DataMapper.setup(:default, "sqlite::memory:")
# Load model code
require_relative "models/story"
# Run any database migrations
DataMapper.finalize
DataMapper.auto_upgrade!

Story.create :text => "A fine :word1 story"

Story.create :text => "A new :word1 story"

Story.create :text => "An old :word1 story"

Story.create :text => "A lousy :word1 story"

class Madlib < Sinatra::Base
  get "/stories/:story_id" do
    Story.get(params[:story_id]).text
  end
end