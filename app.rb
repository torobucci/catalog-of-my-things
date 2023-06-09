require_relative './author'
require_relative './game'
require_relative './classes/book'
require_relative './classes/label'
require_relative './music/genre'
require_relative './music/music_album'
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
    @genres = []
    @albums = []
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

  def list_all_music_albums
    if @music_album.nil? || @music_album.empty?
      puts 'No music albums available'
    else
      @music_album.each do |music_album|
        puts "ID: #{music_album.id}"
        puts "Release Date: #{music_album.published_date}"
        puts "Album Name: #{music_album.name}"
        puts '-----------------------'
      end
    end
  end

  def list_all_genres
    if @genres.empty?
      puts 'No genres available'
    else
      @genres.each do |genre|
        puts "ID: #{genre.id}"
        puts "Name: #{genre.name}"
        puts '-----------------------'
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

  def add_music_album
    album_name, on_spotify, release_date, published_date, archived = user_input(['Enter Album_Name',
                                                                                 'Enter On_Spotify [True/False]',
                                                                                 'Enter Release_date eg "2020-02-05"',
                                                                                 'Enter Published_date eg "2020-02-05"',
                                                                                 'Enter Archived [True/False]'])

    music_album = MusicAlbum.new(album_name, on_spotify, release_date, published_date, archived)

    # Check if @music_album is nil and initialize it as an empty array if needed
    @music_album ||= []

    @music_album << music_album
    puts 'Music Album added successfully'
  end

  def exit_app
    save_games
    save_authors
    save_books
    save_labels
    save_genres
    save_music_album
    puts 'Thank you for using this app!'
    exit
  end
end
