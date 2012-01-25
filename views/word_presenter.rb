class WordPresenter
  attr_reader :words
    
  def initialize word
    @word = word
  end
    
  def prompt_xml
    xml = ""
    words.each do |word|
    xml << "<Say>Please give me a #{word}</Say><Record />"
  xml      
  end
end