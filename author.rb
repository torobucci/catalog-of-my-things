class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json(*_args)
    {
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    author = new(data['first_name'], data['last_name'])
    author.id = data['id'].to_i
    author
  end
end
