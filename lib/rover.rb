require 'plateau'
require 'position'

class Rover
  attr_reader :position

  def initialize(plateau, position)
    @plateau = plateau
    @position = position
  end

  def run
  end
end
