def options(app)
  menu_options = {
    1 => :list_all_books, 2 => :list_all_labels,
    3 => :add_book, 4 => :list_all_music_albums,
    5 => :list_all_genres, 6 => :add_music_album,
    7 => :list_all_games, 8 => :list_all_authors,
    9 => :add_game, 10 => :exit_app
  }

  loop do
    puts "\nPlease choose an option by entering a number:"
    menu_options.each { |key, option| puts "#{key} - #{option.to_s.capitalize.gsub('_', ' ')}" }
    number = gets.chomp.to_i

    if menu_options.key?(number)
      app.send(menu_options[number])
    else
      puts 'Invalid option. Please try again.'
    end
  end
end
