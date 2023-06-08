require_relative './author'
require_relative './game'
require_relative './classes/book'
require_relative './classes/label'
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
    @books = []
    @labels = []
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

  def list_all_books
    if @books.empty?
      puts 'No books available'
    else
      @books.each do |book|
        puts "ID:#{book.id}
              Published_date:#{book.published_date}
              Publisher:#{book.publisher}
              Cover_state:#{book.cover_state}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'No labels available'
    else
      @labels.each do |label|
        puts "ID:#{label.id}
              Title:#{label.title}
              Color:#{label.color}"
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

  def add_book
    publisher, cover_state, published_date, archived = user_input(['Enter publisher',
                                                                   'Enter cover state eg [good/bad]',
                                                                   'Enter published date eg "2020-02-05"',
                                                                   'Enter archirved [True/False]'])

    book = Book.new(publisher, cover_state, published_date, archived)
    @books << book
    puts 'Book added successfully'
  end

  def add_label
    title, color = user_input(['Enter title',
                               'Enter Color'])

    label = Label.new(title, color)
    @labels << label
    puts 'Label added successfully'
  end

  def exit_app
    save_games
    save_authors
    save_books
    save_labels
    puts 'Thank you for using this app!'
    exit
  end
end
