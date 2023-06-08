require_relative '../../music/genre'
require_relative '../../music/music_album'
require 'rspec'

describe Genre do
  before(:each) do
    @genre = Genre.new('Pop')
  end

  context 'testing Genre class' do
    it 'create the instance of Genre class' do
      expect(@genre).to be_an_instance_of(Genre)
    end
    it 'should return the length of items' do
      album = MusicAlbum.new('Ahmad', true, 2022, false)
      @genre.add_item(album)
      expect(@genre.items.length).to eql 1
    end
  end
end
