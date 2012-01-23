require "minitest/autorun"
require_relative "../models/story"

class StoryTest < MiniTest::Unit::TestCase
  def setup
    @story = Story.new "This is a :word1 story."
  end
  
  def test_story_creation
    assert @story
  end
  
  def test_story_can_choose_text
    story_text = "This is my :word1 text"
    @story = Story.new story_text
    assert_equal story_text, @story.text
  end
  
  def test_story_has_text
    assert_equal "This is a :word1 story.", @story.text
  end
end