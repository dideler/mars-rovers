require 'tempfile'

require 'spec_helper'
require 'runner/file_parser'

RSpec.describe Runner::FileParser do
  subject(:fileparser) { Runner::FileParser.new(input_file.path) }

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

  describe '#plateau_coordinates' do
    it 'returns the plateau x y coordinates' do
      expect(fileparser.plateau_coordinates).to match_array([5, 5])
    end
  end
end
