class Definition
  attr_reader :id
  attr_accessor :name, :word_id

  @@definitions = {}
  @@id_count = 0

  def initialize(name, word_id, id)
    @name = name
    @word_id = word_id
    @id = id || @@id_count +=1
  end

  def ==(definition_to_compare)
    (self.name() == definition_to_compare.name()) && (self.word_id() == definition_to_compare.word_id())
  end
end