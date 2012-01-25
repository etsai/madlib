class Story
  include DataMapper::Resource
  
  property :id, Serial
  property :text, Text
  
  def telling
    text.partition(/:\w+/).reject{ |s| s == "" }
  end
end