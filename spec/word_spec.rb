require 'rspec'
require 'word'

describe('#Word') do

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
end