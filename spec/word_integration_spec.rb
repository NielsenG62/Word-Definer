require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exeptions, false)

describe('create a word, edit it, then delete it', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Transformer')
    click_on('Add')
    click_on('Transformer')
    click_on('Edit word')
    fill_in('name', :with => 'Robot')
    click_on('Update')
    click_on('Robot')
    click_on('Edit word')
    click_on('Delete word')
    expect(page).to have_content('There are no words here!')
  end
end