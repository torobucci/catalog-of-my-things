require_relative './app'
require_relative './Modules/options'
def main
  app = App.new
  app.load_games
  app.load_authors
  app.load_books
  app.load_labels
  app.load_music_album
  app.load_genres
  puts 'Welcome to catalog-of-my-things App!'
  options(app)
end
main
