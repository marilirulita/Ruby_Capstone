class Source
  attr_accessor :name, :items
  attr_reader :id

  def initialize(id = rand(1..1000), name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self
  end
end
