require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exeptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Transformer')
    click_on('Add')
    expect(page).to have_content('Transformer')
  end
end