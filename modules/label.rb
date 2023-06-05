require_relative '../item'

class Label < Item
  attr_accessor :title, :author

  def initialize(title, color, id: nil)
    @id = id.nil? ? Random.rand(1..1000) : id
    @title = title
    @color = color
    @items = []
  end
end