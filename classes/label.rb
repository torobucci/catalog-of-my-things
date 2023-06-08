require_relative '../item'

class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color)
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*_args)
    {
      'id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    label = new(data['title'], data['color'])
    label.id = data['id'].to_i
    label
  end
end
