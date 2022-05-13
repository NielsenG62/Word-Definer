require 'rspec'
require 'word'
require 'definition'

describe('#Word') do

  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word1 = Word.new('Transformer', nil)
      word1.save()
      word2 = Word.new('Robot', nil)
      word2.save()
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('#==') do
    it('is the same word if it has the same attributes as another word') do
      word1 = Word.new('Transformer', nil)
      word2 = Word.new('Transformer', nil)
      expect(word1).to(eq(word2))
    end
  end

  describe('.clear') do
    it('clears all words') do
      word1 = Word.new('Transformer', nil)
      word1.save()
      word2 = Word.new('Robot', nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an word by id") do
      word1 = Word.new('Transformer', nil)
      word1.save()
      word2 = Word.new('Robot', nil)
      word2.save()
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word1 = Word.new('Transformer', nil)
      word1.save()
      word1.update("Prime")
      expect(word1.name).to(eq("Prime"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word1 = Word.new('Transformer', nil)
      word1.save()
      word2 = Word.new('Robot', nil)
      word2.save()
      word2.delete()
      expect(Word.all).to(eq([word1]))
    end
  end
end

describe('#definitions') do
    it("returns an word's definitions") do
      word1 = Word.new('Transformer', nil)
      word1.save()
      definition1 = Definition.new("Robot in disguise", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("A device to transfer electricity", @word.id, nil)
      definition2.save()
      expect(word1.definitions).to(eq([definition1, definition2]))
    end
  end