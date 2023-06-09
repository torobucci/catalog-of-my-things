require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, published_date)
    super(published_date)
    @id = rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*_args)
    {
      'id' => @id,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'published_date' => @published_date,
      'archived' => @archived
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    book = new(data['publisher'], data['cover_state'], data['published_date'])
    book.id = data['id'].to_i
    book
  end
end
