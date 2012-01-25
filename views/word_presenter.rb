class WordPresenter
  attr_reader :word

  def initialize word
    @word = word
  end
  
  def type
  end
    
  def prompt_xml
     xml = Builder::XmlMarkup.new
     @word.each do |prompt|
       case prompt
         xml.Say "Please say a"
         xml.Record timeout="8"
       end
     end
   end
end

