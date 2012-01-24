require "minitest/autorun"
require_relative "../app"

class StoryPresenterTest < MiniTest::Unit::TestCase
  def setup
    @story = Story.new :text => "This is a :word1 story."
    @sp = StoryPresenter.new @story
  end

  def test_story_presenter_is_created
    assert @sp
  end
  
  def test_story_presenter_has_story
    assert_equal @story, @sp.story
  end
  
  def test_story_presenter_displays_twilio_xml
    twilio_xml = <<-XML
    <Say>This is a</Say> <Play>:word1</Play> <Say>story</Say>
    XML

    assert_equal twilio_xml, @sp.as_xml
  end
  
end
