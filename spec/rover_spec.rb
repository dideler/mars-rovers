require 'spec_helper'
require 'rover'

RSpec.describe Rover do
  let(:position) { instance_double(Position) }
  subject(:rover) { Rover.new(position) }

  describe '#run' do
    let(:instructions) { 'ABC' }
    it 'executes instructions' do
      expect(Commander).to receive(:execute).with(instructions, rover)
      rover.run(instructions)
    end
  end
end
