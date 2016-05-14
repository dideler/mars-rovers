require 'spec_helper'
require 'plateau'

RSpec.describe Plateau do
  describe '#initialize' do
    it 'raises when initialized with non-positive coordinates' do
      aggregate_failures do
        expect { Plateau.new(max_x: 0, max_y: 0) }.to raise_error(Plateau::InvalidBoundary)
        expect { Plateau.new(max_x: 0, max_y: -1) }.to raise_error(Plateau::InvalidBoundary)
        expect { Plateau.new(max_x: -1, max_y: 0) }.to raise_error(Plateau::InvalidBoundary)
      end
    end
  end

  describe '#within_bounds?' do
    context 'when coordinates are within the plateau boundary' do
      it 'returns true' do
        aggregate_failures do
          plateau = Plateau.new(max_x: 5, max_y: 5)
          expect(plateau.within_bounds?(0, 0)).to be true
          expect(plateau.within_bounds?(3, 3)).to be true
          expect(plateau.within_bounds?(5, 5)).to be true
        end
      end
    end

    context 'when coordinates are outside the plateau boundary' do
      it 'returns false' do
        aggregate_failures do
          plateau = Plateau.new(max_x: 5, max_y: 5)
          expect(plateau.within_bounds?(0, -1)).to be false
          expect(plateau.within_bounds?(5, 6)).to be false
          expect(plateau.within_bounds?(10, -10)).to be false
        end
      end
    end
  end
end
