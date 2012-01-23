class Story
  include DataMapper::Resource
  
  property :id, Serial
  property :text, Text
end