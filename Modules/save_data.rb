module SaveData
  def save_games
    File.open('./JSON/games.json', 'w') do |file|
      json_data = JSON.pretty_generate(@games.map(&:to_json))
      file.write(json_data)
    end
  end

  def save_authors
    File.open('./JSON/authors.json', 'w') do |file|
      json_data = JSON.pretty_generate(@authors.map(&:to_json))
      file.write(json_data)
    end
  end

  def save_books
    File.open('./JSON/books.json', 'w') do |file|
      json_data = JSON.pretty_generate(@books.map(&:to_json))
      file.write(json_data)
    end
  end

  def save_labels
    File.open('./JSON/labels.json', 'w') do |file|
      json_data = JSON.pretty_generate(@labels.map(&:to_json))
      file.write(json_data)
    end
  end

  def save_music_album
    return if @music_album.nil? || @music_album.empty?
  
    music_album_data = @music_album.map(&:to_json)
    json_data = JSON.pretty_generate(music_album_data)
  
    File.open('./JSON/music_album.json', 'w') do |file|
      file.write(json_data)
    end
  end  

  def save_genres
    return if @genres.nil? || @genres.empty?
  
    File.open('./JSON/genre.json', 'w') do |file|
      json_data = JSON.pretty_generate(@genres.map(&:to_json))
      file.write(json_data)
    end
  end  
end
