class WordPresenter
  attr_reader :noun

  def initialize noun
    @noun = noun
  end
  
  def as_xml
    xml = Builder::XmlMarkup.new
        xml.instruct!
        xml.Response do
          xml.Say("Welcome to Twilio Madlib.")
          xml.Say("Please say a")
          xml.Say(@noun)
          xml.Record(maxLength="30" action="hello-monkey-handle-recording.php")
          xml.Hangup
        end
    end
end