class StoryPresenter
  attr_reader :story

  def initialize story
    @story = story
  end
  # <Say> I once went walking along a </Say><Play> asfadsgas.dasfdasmai.mp3</Play> <Say>when I ...</Say>
  def telling_xml
    xml = ""
    @story.telling.each do |phrase|
      case phrase
      when String
        xml << "<Say>#{phrase}</Say>"
      when Word
        xml << "<Play>#{phrase.url}</Play>"
      end
    end
    xml
  end
end
