require "minitest/autorun"
require_relative "../app"

class StoryPresenterTest < MiniTest::Unit::TestCase
  def setup
    @story = Story.new :text => "This is a :word1 story."
    @word = Word.new :url => "word1.mp3", :type => "word"
    @story.add_word @word
    @sp = StoryPresenter.new @story
  end

  def test_story_presenter_is_created
    assert @sp
  end

  def test_story_presenter_has_story
    assert_equal @story, @sp.story
  end

  def test_story_presenter_telling_xml_says_a_story
    @story = Story.new :text => "This is a story."
    @sp = StoryPresenter.new @story

    assert_equal "<Say>This is a story.</Say>", @sp.telling_xml
  end

  def test_story_presenter_telling_xml_plays_words
    assert_equal "<Say>This is a </Say><Play>word1.mp3</Play><Say> story.</Say>",
      @sp.telling_xml
  end
end
