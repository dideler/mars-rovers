require 'commands/commander'
require 'plateau'
require 'position'

class Rover
  attr_reader :position

  def initialize(plateau, position)
    @plateau = plateau
    @position = position
  end

  def run(instructions)
    Commander.execute(instructions, self)
  end

  def direction
    position.direction
  end

  def turn(angle_degrees)
    position.change_orientation_by_angle(angle_degrees)
  end

  def move_forward(units = 1)
    position.change_coordinates_by(0, 1)
  end
end
