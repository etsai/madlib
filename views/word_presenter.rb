class WordPresenter
  attr_reader :noun

  def initialize noun
    @noun = noun
  end
  
  def as_xml
    builder do |xml|
        xml.instruct!
        xml.Response do
          xml.Say("Please say a")
          xml.Say(@noun)
          xml.Record(maxLength="30" action="hello-monkey-handle-recording.php")
          xml.Hangup
  end
end