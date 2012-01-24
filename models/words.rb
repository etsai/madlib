class Words
  include DataMapper::Resource
  
  property :id, Serial
  property :noun, URL
  property :verb, URL
  property :action, URL
  property :food, URL
end