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
end
