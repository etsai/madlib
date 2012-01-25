require "minitest/autorun"
require_relative "../app"

class WordPresenterTest < MiniTest::Unit::TestCase
  def setup
    @story = Story.new :text => "This is a :word1 story."
    @sp = StoryPresenter.new @story
    @word = Word.new :url => "http://www.google.com/foo.mp3"
    @wp = StoryPresenter.new @word
  end

  def test_word_prompt_is_created
    assert @wp
  end
  
  def test_story_presenter_has_xml
    @word = Word.new :type => "Say a word."
    @wp = WordPresenter.new @word
    assert_equal "<Say>Say a word</Say>", @wp.prompt_xml
  end
end