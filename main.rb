require_relative './app'
require_relative './Modules/options'
def main
  app = App.new
  app.load_games
  app.load_authors
  puts 'Welcome to catalog-of-my-things App!'
  options(app)
end
main
