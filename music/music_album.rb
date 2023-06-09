require_relative '../item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :release_date

  def initialize(name, on_spotify, release_date, published_date, archived)
    super(published_date, archived)
    @on_spotify = on_spotify
    @name = name
    @release_date = release_date
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(*_args)
    {
      'id' => @id,
      'published_date' => @published_date,
      'archived' => @archived,
      'on_spotify' => @on_spotify,
      'name' => @name,
      'release_date' => @release_date
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    album = new(data['name'], data['on_spotify'], data['release_date'], data['published_date'], data['archived'])
    album.id = data['id'].to_i
    album
  end
end
