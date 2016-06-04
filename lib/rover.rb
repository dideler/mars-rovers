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

  def move_safely(y_delta)
    position.change_coordinates_by(0, y_delta) if safe_to_move?(y_delta)
  end

  private

  def safe_to_move?(y_delta)
    plateau.within_bounds?(position.coordinates.x, position.coordinates.y + y_delta)
  end

  attr_reader :plateau
end
