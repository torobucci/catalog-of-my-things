class Genre
    attr_accessor :name, :Items
    attr_reader :id

    
  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end
end