require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application
set(:show_exeptions, false)

describe('The word Path', {:type => :feature}) do

  before(:each) do
    Word.clear()
    Definition.clear()
    @test_word = Word.new('Rock', nil)
    @test_word.save
    @test_word_id = @test_word.id
  end

  it('Creates a word') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Transformers')
    click_on('Add')
    expect(page).to have_content('Transformers')
  end

  it('updates a word') do
    visit('/')
    click_on('Rock')
    click_on('Edit word')
    fill_in('name', :with => 'Robots')
    click_on('Update')
    expect(page).to have_content('Robots')
  end

  it('deletes a word') do
    visit("/words/#{@test_word_id}/edit")
    click_button('Delete word')
    expect(page).to have_no_content('Rock')
  end
end

describe('The definition path', {:type => :feature}) do

  before(:each) do
    Word.clear()
    Definition.clear()
    @test_word = Word.new('Rock', nil)
    @test_word.save
    @test_word_id = @test_word.id
  end

  it('Creates a definition') do
    visit("/words/#{@test_word_id}")
    fill_in('definition_name', :with => 'A piece of earth')
    click_on('Add definition')
    expect(page).to have_content('A piece of earth')
  end

  it('Updates a definition') do
    test_definition = Definition.new('Not just a boulder', @test_word_id, nil)
    test_definition.save
    test_definition_id = test_definition.id.to_i
    visit("/words/#{@test_word_id}/definitions/#{test_definition_id}")
    fill_in('name', :with => "It's a rock")
    click_on('Update')
    expect(page).to have_content("It's a rock")
  end

  it('Deletes a definition') do
    test_definition = Definition.new('Not just a boulder', @test_word_id, nil)
    test_definition.save
    test_definition_id = test_definition.id.to_i
    visit("/words/#{@test_word_id}/definitions/#{test_definition_id}")
    click_on('Delete definition')
    expect(page).to have_no_content("Not just a boulder")
  end
end