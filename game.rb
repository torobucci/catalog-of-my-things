require_relative './item'
class Game < Item
  attr_accessor :archived, :published_date, :multiplayer, :last_played_at

  def initialize(published_date, archived, multiplayer, last_played_at)
    super(published_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    current_date = Time.now
    last_played_at = Time.parse(@last_played_at)
    two_years_ago = Time.new(current_date.year - 2, current_date.month, current_date.day)
    super() && last_played_at < two_years_ago
  end

  def to_json(*_args)
    {
      'id' => @id,
      'published_date' => @published_date,
      'archived' => @archived,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    game = new(data['published_date'], data['archived'], data['multiplayer'], data['last_played_at'])
    game.id = data['id'].to_i
    game
  end
end
