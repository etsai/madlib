class Story
  include DataMapper::Resource

  SYMBOL_REGEX = /:\w+/

  property :id, Serial
  property :text, Text

  has n, :words

  def telling
    word_index = -1
    phrases.reject{ |s| s == "" }.map do |s|
      if s[0] == ':'
        # If the string starts with a symbol, replace it with the next word.
        words[word_index += 1]
      else
        # Otherwise, leave the string.
        s
      end
    end
  end

  def complete?
    symbol_count == words.size
  end

  def phrases
    @phrases ||= begin
                   phrases = []
                   remaining = text
                   while remaining =~ SYMBOL_REGEX
                     text, symbol, remaining = remaining.partition SYMBOL_REGEX
                     phrases << text
                     phrases << symbol
                   end
                   phrases << remaining
                 end
  end

  def symbols
    @symbols ||= phrases.select{ |s| s[0] == ':' }.map{ |s| s[1..-1] }
  end

  def next_symbol
    symbols[words.size]
  end


  def symbol_count
    symbols.size
  end

  def add_word word
    words << word
    save && word
  end
end
