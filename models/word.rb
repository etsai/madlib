class Word
  include DataMapper::Resource
  
  property :id, Serial
  property :url, String
  property :type, String
end