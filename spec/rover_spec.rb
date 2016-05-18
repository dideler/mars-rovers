require 'spec_helper'
require 'rover'

RSpec.describe Rover do
  let(:plateau) { instance_double(Plateau) }
  let(:position) { instance_double(Position) }
  subject(:rover) { Rover.new(plateau, position) }

  xdescribe '#run' do
    context 'with no input' do
      it 'stays at its starting position' do
        rover.run
        expect(rover.position).to eq(position)
      end
    end
  end
end
