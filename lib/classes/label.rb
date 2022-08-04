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

  def to_json(*_args)
    {
      id: @id,
      title: @title,
      color: @color,
      items: @items
    }.to_json
  end

  def self.json_create(object)
    new(object['title'], object['color'], object['id'])
  end
end
