require_relative './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, publish_date, archived, id = rand(1..1000))
    super(publish_date, id, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, '%Y-%m-%d')
  end
end
