require_relative './item'

class Book < Item
  attr_reader :publisher, :cover_state, :id, :archived
  def initialize(publisher, cover_state, publish_date, archived, id = rand(1..1000))
    super(publish_date, id, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end
  
  def can_be_archived?
    super || @cover_state == 'bad'
  end

end