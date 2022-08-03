require_relative 'item'

class Movie < Item
  def initialize(publish_date, id = rand(1..1000), archived: false, silet: false)
    super(publish_date, id, archived: archived)
    @silet = silet
  end

  def can_be_archived?
    super || @silet ? true : false
  end

  def to_json()
    {
      'id' => id,
      'genre_id' => @genre.id,
      'author_id' => @author.id,
      'source_id' => @source.id,
      'label_id' => @label.id,
      'silet' => @silet
    }.to_json()
  end
end
