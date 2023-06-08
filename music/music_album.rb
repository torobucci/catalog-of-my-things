require '../../item'

require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name

  def initialize(name, on_spotify, published_date, archived)
    super(published_date, archived)
    @on_spotify = on_spotify
    @name = name
  end

  def can_be_archived?
    super && @on_spotify
  end
end
