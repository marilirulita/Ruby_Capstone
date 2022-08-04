class Label
  attr_reader :title, :color, :items, :id

  def initialize(title, color, id = rand(1..1000), items = [])
    @title = title
    @color = color
    @id = id
    @items = items
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
