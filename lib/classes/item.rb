require 'date'
# https://apidock.com/ruby/Date/strptime/class
class Item
  attr_reader :publish_date, :id, :archived
  attr_accessor :genre, :author, :label, :source

  def initialize(publish_date, id = rand(1..1000), archived: false)
    @id = id
    @publish_date = Date.strptime(publish_date, '%Y-%m-%d')
    @archived = archived
  end

  def add_genre(genre)
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author(author)
    author.add_item(self) unless author.items.include?(self)
  end

  def add_label(label)
    label.add_item(self) unless label.items.include?(self)
  end

  def add_source(source)
    source.add_item(self) unless source.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    @publish_date < Date.new(Date.today.year - 10, Date.today.month, Date.today.day)
  end
end
