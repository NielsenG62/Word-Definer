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

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  name = params[:word_name]
  word = Word.new(name,nil)
  word.save()
  redirect to('/words')
end