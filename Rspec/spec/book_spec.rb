require_relative '../../item'
require_relative '../../classes/book'

RSpec.describe Book do
  let(:published_date) { '2012-01-01' }
  let(:publisher) { 'Publisher' }
  let(:cover_state) { 'good' }
  subject(:book) { described_class.new(publisher, cover_state, published_date) }

  describe '#can_be_archived?' do
    context 'when the cover_state is good and the published_date is more than 10 years ago' do
      let(:published_date) { (Time.now - (11 * 365 * 24 * 60 * 60)).to_s }

      it 'returns true' do
        expect(book.can_be_archived?).to be true
      end
    end

    context 'when the cover_state is bad' do
      let(:cover_state) { 'bad' }

      it 'returns true' do
        expect(book.can_be_archived?).to be true
      end
    end

    context 'when the cover_state is good and the published_date is within 10 years' do
      let(:published_date) { (Time.now - (9 * 365 * 24 * 60 * 60)).to_s }

      it 'returns false' do
        expect(book.can_be_archived?).to be false
      end
    end
  end
end
