require_relative './author'
require_relative './game'
require_relative './Modules/user_input'
require_relative './Modules/save_data'
require_relative './Modules/load_data'
require 'json'
class App
  include UserInput
  include SaveData
  include LoadData
  def initialize
    @games = []
    @authors = []
  end

  def list_all_games
    if @games.empty?
      puts 'No games available'
    else
      @games.each do |game|
        puts "ID:#{game.id}
              Published_date:#{game.published_date}
              Multiplayer:#{game.multiplayer}
              Last_played:#{game.last_played_at}"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'There are no authors'
    else
      @authors.each do |author|
        puts "Author: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def add_game
    published_date, archived, multiplayer, last_played_at = user_input(['Enter published date eg "2020-02-05"',
                                                                        'Enter archirved [True/False]',
                                                                        'Enter multiplayer [True/False]',
                                                                        'Enter last played date eg "2020-02-05"'])

    game = Game.new(published_date, archived, multiplayer, last_played_at)
    @games << game
    puts 'Game added successfully'
  end

  def exit_app
    save_games
    save_authors
    puts 'Thank you for using this app!'
    exit
  end
end
