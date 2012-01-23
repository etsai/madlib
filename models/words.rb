class Words
  include DataMapper::Resource
  
  property :id, Serial
  property :word1, URL
  property :word2, URL
end