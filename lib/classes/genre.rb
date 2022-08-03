class Genre
  attr_accessor :items
  attr_reader :id, :name

  def initialize(name, id = rand(1..1000))
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
