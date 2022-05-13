require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe('#definition') do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new('Transformer', nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition1 = Definition.new("Robot in disguise", @word.id, nil)
      definition2 = Definition.new("Robot in disguise", @word.id, nil)
      expect(definition1).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition1 = Definition.new("Robot in disguise", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("A device to transfer electricity", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition1 = Definition.new("Robot in disguise", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("A device to transfer electricity", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition1 = Definition.new("Robot in disguise", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("A device to transfer electricity", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

  describe('.find') do
    it("finds an definition by id") do
      definition1 = Definition.new("Robot in disguise", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("A device to transfer electricity", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition1.id)).to(eq(definition1))
    end
  end
end