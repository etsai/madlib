class StoryPresenter
  attr_reader :story

  def initialize story
    @story = story
  end
  
  def as_xml
    builder do |xml|
        xml.instruct!
        xml.Response do
          xml.Say(@story)
          xml.Play(:word1)
          xml.Hangup
  end
end
