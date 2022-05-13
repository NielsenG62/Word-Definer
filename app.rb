require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  redirect to('/words')
end

get('/words') do
  @words = Word.all
  erb(:words)
end