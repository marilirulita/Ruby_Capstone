require_relative 'item'

class Movie < Item
  def initialize(publish_date, id = rand(1..1000), archived: false, silet: false)
    super(publish_date, id, archived: archived)
    @silet = silet
  end

end