require_relative 'item'

class Movie < Item
  def initialize(publish_date, id = rand(1..1000), archived: false, silet: false)
    super(publish_date, id, archived: archived)
    @silet = silet
  end

  def can_be_archived?
    super || @silet ? true : false
  end

  def to_json(*_args)
    {
      JSON.create_id => self.class.name,
      'silet' => @silet,
      # inherited
      'id' => id,
      'archived' => @archived
      'publish_date' =>  @publish_date
      'genre' => @genre.to_json,
      'author' => @author.id,
      'source' => @source.id,
      'label' => @label.id
    }.to_json(*args)
  end
end
