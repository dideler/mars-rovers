require 'spec_helper'
require 'commands/commander'

RSpec.describe Commander do
  describe '.execute' do
    subject { Commander.execute(instructions, rover) }
    let(:rover) { double }

    context 'when given known instructions' do
      let(:instructions) { 'LRM' }
      it 'executes the relevant commands' do
        expect(LeftCommand).to receive(:execute).with(rover).ordered
        expect(RightCommand).to receive(:execute).with(rover).ordered
        expect(MoveCommand).to receive(:execute).with(rover).ordered
        subject
      end
    end

    context 'when given unknown instructions' do
      let(:instructions) { '💥' }
      it 'raises InvalidInstruction' do
        expect { subject }.to raise_error(Commander::InvalidInstruction)
      end
    end

    context 'when instructions contain whitespace' do
      let(:instructions) { ' ' }
      it 'raises InvalidInstruction' do
        expect { subject }.to raise_error(Commander::InvalidInstruction)
      end
    end
  end
end
