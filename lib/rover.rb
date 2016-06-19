require 'commands/commander'
require 'position'

class Rover
  attr_reader :position

  def initialize(position)
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

  def move_straight_safely(units)
    position.try_moving_straight(units)
  end
end
