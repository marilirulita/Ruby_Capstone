class Author
  attr_accessor :items

  def initialize(id, name, last_name)
    @id = id
    @name = name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    ""
  end
end
