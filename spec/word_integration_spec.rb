require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exeptions, false)

describe('create a word, edit it, then delete it', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
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