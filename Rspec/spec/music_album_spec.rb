# File: music_album_spec.rb

require_relative '../music_album' # Assuming the MusicAlbum class is defined in music_album.rb

RSpec.describe MusicAlbum do
  # Test case for the initialization of a MusicAlbum instance
  describe '#initialize' do
    it 'creates a new MusicAlbum instance with the given attributes' do
      album = MusicAlbum.new('Thriller', 'Michael Jackson', 1982)
      expect(album.title).to eq('Thriller')
      expect(album.artist).to eq('Michael Jackson')
      expect(album.year).to eq(1982)
    end
  end

  # Test case for the #play method
  describe '#play' do
    it 'returns a string indicating that the album is being played' do
      album = MusicAlbum.new('Thriller', 'Michael Jackson', 1982)
      expect(album.play).to eq('Playing Thriller by Michael Jackson')
    end
  end
end
