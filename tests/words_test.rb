require "minitest/autorun"
require_relative "../app"

class WordTest < MiniTest::Unit::TestCase
  def setup
    @story = Story.new :text => "This is a :word1 story."
    @sp = StoryPresenter.new @story
    @word = Word.new :url => "http://www.google.com/foo.mp3"
  end

  def test_words_is_created
    assert @word
  end

  def test_word_have_url
    assert_equal "http://www.google.com/foo.mp3", @word.url
  end
  
  def test_word_have_type
    @word = Word.new :type => "noun"
    assert_equal "noun", @word.type
  end
  
end