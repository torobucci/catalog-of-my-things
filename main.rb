require_relative './app'
require_relative './Modules/options'
def main
  app = App.new
  puts 'Welcome to catalog-of-my-things App!'
  options(app)
end
main
