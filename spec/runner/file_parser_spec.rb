require 'tempfile'

require 'spec_helper'
require 'runner/file_parser'

RSpec.describe Runner::FileParser do
  let(:input_file) { Tempfile.new }

  before do
    input_file.write <<~HEREDOC
      5 5

      1 2 N

      LMLMLMLMM

      3 3 E

      MMRMMRMRRM
    HEREDOC
    input_file.rewind
  end

  describe '.call' do
    it 'parses the file' do
      fp = Runner::FileParser.call(input_file.path)
      expect(fp.plateau_coordinates).to eq(['5', '5'])
      expect(fp.rover_data).to eq(['1 2 N', 'LMLMLMLMM', '3 3 E', 'MMRMMRMRRM'])
    end
  end
end
