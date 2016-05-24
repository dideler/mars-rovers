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
    new_x, new_y = position.change_coordinates_by(0, 1, dry_run: true)
    position.change_coordinates_by(0, 1) if safe_to_move?(new_x, new_y)
  end

  private

  def safe_to_move?(x, y)
    plateau.within_bounds?(x, y)
  end

  attr_reader :plateau
end
