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

Story.create :text => "A :adjective story"

class Madlib < Sinatra::Base
  get "/" do
    twilio_xml_response do
      "<Say>Welcome to Twilio Madlib</Say>"
    end
    redirect "/stories/:story_id"
  end

  get "/stories/:story_id" do

    StoryPresenter.new(Story.get(params[:story_id]))
  end

  post "/stories/:story_id/:word_type" do
    # Get the POST Body and create a Nokogiri parser for it.
    xml = Nokogiri::XML::Document.new(request.body.read)

    Story.get(params[:story_id]).add_word(
      Word.new(:type => params[:word_type],
               :url => xml.at_css("RecordingUrl").text))
  end

  before do
    content_type :xml
  end

  helpers  do
    def twilio_xml_response
      xml = '<?xml version="1.0" encoding="UTF-8"?><Response>'
      xml << yield
      xml << '</Response>'
    end
  end
end

