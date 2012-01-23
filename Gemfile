source "http://rubygems.org"

gem "rake"
gem "sinatra", :require => ["sinatra/base"]
gem "builder"
gem "data_mapper"

group :test, :development do
  gem "rerun"
end

group :development do
  gem "dm-sqlite-adapter"
end

group :production do
  "dm-postgres-adapter"
end

group :test do 
  gem 'minitest'
end

