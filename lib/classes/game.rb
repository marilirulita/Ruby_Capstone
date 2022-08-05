require_relative './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, publish_date, archived, id = rand(1..1000))
    super(publish_date, id, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, '%Y-%m-%d')
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => id,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'publish_date' => publish_date,
      'genre_id' => @genre.to_json,
      'author_id' => @author.id,
      'source_id' => @source.id,
      'label_id' => @label.id,
      'archived' => archived
    }.to_json(*args)
  end

  private

  def can_be_archived?
    super && @last_played_at < Date.new(Date.today.year - 2, Date.today.month, Date.today.day)
  end
end