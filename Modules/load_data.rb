module LoadData
  def load_games
    return unless File.exist?('./JSON/games.json') && !File.empty?('./JSON/games.json')

    json_data = File.read('./JSON/games.json')
    @games = JSON.parse(json_data).map { |game_data| Game.from_json(game_data) }
  end

  def load_authors
    return unless File.exist?('./JSON/authors.json') && !File.empty?('./JSON/authors.json')

    json_data = File.read('./JSON/authors.json')
    @authors = JSON.parse(json_data).map { |author_data| Author.from_json(author_data) }
  end

  def load_books
    return unless File.exist?('./JSON/books.json') && !File.empty?('./JSON/books.json')

    json_data = File.read('./JSON/books.json')
    @books = JSON.parse(json_data).map { |book_data| Book.from_json(book_data) }
  end

  def load_labels
    return unless File.exist?('./JSON/labels.json') && !File.empty?('./JSON/labels.json')

    json_data = File.read('./JSON/labels.json')
    @labels = JSON.parse(json_data).map { |label_data| Label.from_json(label_data) }
  end

  def load_music_album
    return unless File.exist?('./JSON/music_album.json') && !File.empty?('./JSON/music_album.json')

    json_data = File.read('./JSON/music_album.json')
    music_album_data = JSON.parse(json_data)
    @music_album = music_album_data.map { |album_data| MusicAlbum.from_json(album_data) }
  end

  def load_genres
    return unless File.exist?('./JSON/genre.json') && !File.empty?('./JSON/genre.json')

    json_data = File.read('./JSON/genre.json')
    @genres = JSON.parse(json_data).map { |genre_data| Genre.from_json(genre_data) }
  end
end
