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

  def test_story_presenter_uses_String
    @story = Story.new :text => "This is a story."
    @sp = StoryPresenter.new @story

    assert_equal "<Say>This is a story.</Say>", @sp.telling_xml
  end
end
