require_relative '../../game'
require 'rspec'

describe Game do
  let(:current_date) { Time.now }
  let(:two_years_ago) { Time.new(current_date.year - 2, current_date.month, current_date.day) }

  describe '#initialize' do
    it 'sets the attributes correctly' do
      game = Game.new('2021-01-01', true, '2022-12-31')
      expect(game.published_date).to eq('2021-01-01')
      expect(game.archived).to eq(false)
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to eq('2022-12-31')
    end
  end

  describe '#can_be_archived?' do
    context 'when the game was played more than two years ago and can be archived' do
      it 'returns true' do
        game = Game.new('2010-01-01', true, '2020-01-01')
        expect(game.can_be_archived?).to eq(true)
      end
    end

    context 'when the game was played less than two years ago and cannot be archived' do
      it 'returns false' do
        game = Game.new('2022-01-01', true, '2023-01-01')
        expect(game.can_be_archived?).to eq(false)
      end
    end

    context 'when the game was played less than two years ago and can be archived' do
      it 'returns false' do
        game = Game.new('2012-01-01', true, '2023-01-01')
        expect(game.can_be_archived?).to eq(false)
      end
    end

    context 'when the game was played more than two years ago and cannot be archived' do
      it 'returns false' do
        game = Game.new('2022-01-01', true, '2019-01-01')
        expect(game.can_be_archived?).to eq(false)
      end
    end
  end
end
