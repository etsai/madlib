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

Story.create :text => "Here is a :adjective Twilio fact. :number Twilion's are :feeling :verb"

class Madlib < Sinatra::Base
  get "/" do
    twilio_xml_response do
      "<Say>Welcome to Twilio Madlib</Say>"
    end
    redirect "/stories/:story_id"
  end

  get "/stories/:story_id" do
    story = Story.get params[:story_id]

    if story.complete?
      twilio_xml_response do
        StoryPresenter.new(story).telling_xml
      end
    else
      redirect "/stories/#{story.id}/#{story.next_word_type}"
    end
  end

  get "/stories/:story_id/:word_type" do
    story = Story.get params[:story_id]

    twilio_xml_response do
      <<-XML
<Say>Record a #{params[:word_type]}</Say>
<Record action="http://#{TLD}/stories/#{story.id}/#{params[:word_type]}" method="post" />
      XML
    end
  end

  post "/stories/:story_id/:word_type" do
    # Get the POST Body and create a Nokogiri parser for it.
    xml = Nokogiri::XML::Document.new(request.body.read)
    story = Story.get params[:story_id]

    story.add_word Word.new :type => params[:word_type],
                            :url => xml.at_css("RecordingUrl").text
    if story.complete?
      redirect "/stories/#{story.id}"
    else
      redirect "/stories/#{story.id}/#{story.next_word_type}"
    end
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

