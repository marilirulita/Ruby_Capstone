require_relative 'item'

class Movie < Item
  def initialize(publish_date, id = rand(1..1000), archived: false, silet: false)
    super(publish_date, id, archived: archived)
    @silet = silet
  end

  def can_be_archived?
    super || @silet ? true : false
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => id,
      'silet' => @silet
    }.to_json(*args)
  end
end
