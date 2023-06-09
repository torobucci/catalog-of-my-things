class Genre
  attr_accessor :name, :items, :id

  def initialize(name)
    @id = rand(1..100)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end

  def to_json(*_args)
    {
      'id' => @id,
      'name' => @name
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    genre = new(data['name'])
    genre.id = data['id'].to_i
    genre
  end
end
