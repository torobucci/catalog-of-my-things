require_relative '../item'

def class Book < Item
  attr_accessor :publisher, :cover_state
end
