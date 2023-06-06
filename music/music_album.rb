require './item'

class MusicAlbum < Item
    attr_accessor :on_spotify, :name

    def initialize(name:, on_spotify:, publish_date:)
        super(nil, nil, nil, nil, publish_date)
        @on_spotify = on_spotify
        @name = name
    end
end