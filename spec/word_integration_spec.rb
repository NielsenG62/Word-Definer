require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exeptions, false)

before(:each) do
  Album.clear()
  Song.clear()
end

describe('create a word path', {:type => :feature}) do
  it('create a word, edit it, then delete it') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Transformers')
    click_on('Add')
    click_on('Transformers')
    click_on('Edit word')
    fill_in('name', :with => 'Robots')
    click_on('Update')
    click_on('Robots')
    click_on('Edit word')
    click_on('Delete word')
    expect(page).to have_no_content('Robots')
  end
end

describe('create a song path', {:type => :feature}) do
  it('Creates a word. Creates, updates, and deletes a definition') do
    test_word = Word.new('Rock', 100)
    test_word.save
    visit("/words/#{test_word.id}")
    fill_in('definition_name', :with => 'A piece of earth')
    click_on('Add definition')
    expect(page).to have_content('A piece of earth')
  end
end