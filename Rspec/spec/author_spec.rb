require_relative '../../author'
require_relative '../../item'
require 'rspec'

describe Author do
  let(:first_name) { 'Kevin' }
  let(:last_name) { 'Toro' }
  let(:author) { Author.new(first_name, last_name) }

  describe '#initialize' do
    it 'should receive and set first and last names of author' do
      expect(author.first_name).to eql(first_name)
      expect(author.last_name).to eql(last_name)
    end
    it 'first and last names should be strings' do
      expect(author.first_name).to be_a(String)
      expect(author.last_name).to be_a(String)
    end
  end

  describe '#add item' do
    let(:item) { double('Item') }

    it 'adds the item to the author\'s items' do
      expect(item).to receive(:author=).with(author)
      author.add_item(item)

      expect(author.items).to include(item)
    end

    it 'sets the author of the item to the current author' do
      allow(item).to receive(:author=)
      author.add_item(item)
      allow(item).to receive(:author).and_return(author)
      expect(item.author).to eq(author)
    end
  end
end
