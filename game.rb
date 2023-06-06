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
end
