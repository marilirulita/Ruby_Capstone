require_relative './item'

class Book < Item
  attr_reader :publisher, :cover_state, :id, :archived

  def initialize(publisher, cover_state, publish_date, archived, id = rand(1..1000))
    super(publish_date, id, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def to_json(*args)
    {
      id: id,
      publisher: @publisher,
      cover_state: @cover_state,
      publish_date: publish_date,
      archived: archived
      label_id:@label.id,
      source:@source.id,
      author:@author.id,
      genre:@genre.id,
      JSON.create_id => self.class.name
    }.to_json
  end
end
