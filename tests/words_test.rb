require "minitest/autorun"
require_relative "../app"

class WordTest < MiniTest::Unit::TestCase
  def setup
    @story = Story.new :text => "This is a :word1 story."
    @sp = StoryPresenter.new @story
    @word = Words.new :url => word_url
  end

  def test_words_is_created
    assert @words
  end

  def test_story_can_choose_text
    story_text = "This is my :word1 text"
    @word = Words.new :url => word_url
    assert_equal word_url, @word.url
  end

  def test_words_have_url
    assert_equal "http://www.google.mp3", @word.url
  end
  
end