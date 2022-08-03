class Genre
  attr_accessor :items
  attr_reader :id, :name

  def initialize(id = rand(1..1000), name)
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
