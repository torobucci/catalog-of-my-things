require_relative '../../music/music_album'
require 'rspec'

describe MusicAlbum do
  let(:album) { MusicAlbum.new('James', true, 2022, false) }

  context 'testing MusicAlbum class' do
    it 'create the instance of MusicAlbum class' do
      expect(album).to be_an_instance_of(MusicAlbum)
    end

    it 'should return correct name' do
      expect(album.name).to eql('James')
    end

    it 'should return correct spotify status' do
      expect(album.on_spotify).to eql(true)
    end

    it 'should return the correct date for publish date' do
      expect(album.published_date).to eql(2022)
    end
  end
end
