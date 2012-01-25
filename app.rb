require "bundler"
Bundler.require

# Establish Database connection
DataMapper.setup(:default, "sqlite::memory:")
# Load model code
require_relative "models/story"
require_relative "models/word"
# Run any database migrations
DataMapper.finalize
DataMapper.auto_upgrade!

# Load view code
require_relative "views/story_presenter"

Story.create :text => "A fine :word1 story"

Story.create :text => "A new :word1 story"

Story.create :text => "An old :word1 story"

Story.create :text => "A lousy :word1 story"

class Madlib < Sinatra::Base
  get "/stories/:story_id" do
    Story.get(params[:story_id]).text
  end

  helpers  do
    def twilio_xml_response
      xml = '<?xml version="1.0" encoding="UTF-8"?><Response>'
      xml << yield
      xml << '</Response>'
    end
  end
end

