require_relative '../../item'
require_relative '../../classes/book'

RSpec.describe Book do
  let(:published_date) { '2010-01-01' }
  let(:archived) { false }
  let(:publisher) { 'Publisher' }
  let(:cover_state) { 'good' }
  let(:book) { Book.new(publisher, cover_state, published_date, archived) }

  describe '#initialize' do
    it 'sets the publisher' do
      expect(book.publisher).to eq(publisher)
    end

    it 'sets the cover_state' do
      expect(book.cover_state).to eq(cover_state)
    end

    it 'inherits the published_date attribute from the parent class' do
      expect(book.published_date).to eq(published_date)
    end

    it 'inherits the archived attribute from the parent class' do
      expect(book.archived).to eq(archived)
    end
  end

  describe '#can_be_archived?' do
    context 'when cover_state is bad' do
      let(:cover_state) { 'bad' }

      it 'returns true' do
        expect(book.can_be_archived?).to eq(true)
      end
    end

    context 'when parent method returns true' do
      let(:archived) { true }

      it 'returns true' do
        expect(book.can_be_archived?).to eq(true)
      end
    end
  end

  describe '#move_to_archive' do
    context 'when book can be archived' do
      let(:archived) { false }

      it 'sets archived to true' do
        book.move_to_archive
        expect(book.archived).to eq(true)
      end
    end

    context 'when book cannot be archived' do
      let(:archived) { true }

      it 'does not change the value of archived' do
        expect { book.move_to_archive }.not_to(change { book.archived })
      end
    end
  end
end
