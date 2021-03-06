require "minitest/autorun"
require_relative "../app"

class StoryTest < MiniTest::Unit::TestCase
  def setup
    @story = Story.new :text => "This is a :word1 story."
  end

  def test_story_creation
    assert @story
  end

  def test_story_can_choose_text
    story_text = "This is my :word1 text"
    @story = Story.new :text => story_text
    assert_equal story_text, @story.text
  end

  def test_story_has_text
    assert_equal "This is a :word1 story.", @story.text
  end

  def test_story_can_add_words
    word = Word.create :url => "noun.mp3", :type => "noun"
    @story.add_word word
    assert_includes @story.words, word
  end

  def test_story_telling_returns_array_of_story_text
    story = Story.new :text => "A wordless story"
    assert_equal ["A wordless story"], story.telling
  end

  def test_story_breaks_text_into_phrases
    assert_equal 3, @story.phrases.size
  end

  def test_story_counts_symbols_in_text
    assert_equal 1, @story.symbol_count
  end

  def test_story_with_the_correct_amount_of_words_is_complete
    refute @story.complete?

    @story.add_word Word.new :type => "word1", :url => "Doesn't matter"
    assert @story.complete?
  end

  def test_next_symbol_returns_type_of_next_needed_word
    assert_equal "word1", @story.next_symbol
  end

  def test_story_telling_breaks_symbols_out_into_words
    noun = Word.create :type => 'noun', :url => 'noun.mp3'
    verb = Word.create :type => 'verb', :url => 'verb.mp3'
    story = Story.new :text => "This story totally :verb my :noun"
    story.add_word noun
    story.add_word verb

    refute_includes story.telling, ":verb"
    refute_includes story.telling, ":noun"
    assert_includes story.telling, noun
    assert_includes story.telling, verb
  end
end
