require 'spec_helper'
require 'commands/commander'

RSpec.describe Commander do
  describe '.execute' do
    subject { Commander.execute(instructions, rover) }
    let(:rover) { double }

    context 'when given known instructions'

    context 'when given unknown instructions' do
      let(:instructions) { '💥' }
      it 'raises' do
        expect { subject }.to raise_error(Commander::InvalidInstruction)
      end
    end

    context 'when given no instructions'

    context 'when instructions are missing'
  end
end
