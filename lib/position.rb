require 'coordinates'
require 'orientation'
require 'plateau'

class Position
  attr_reader :coordinates, :orientation
  alias_method :location, :coordinates
  alias_method :direction, :orientation

  def initialize(coordinates, orientation, plateau)
    @coordinates = coordinates
    @orientation = orientation
    @plateau = plateau
  end

  def try_moving_straight(units)
    case
    when orientation.east?, orientation.west?
      change_coordinates_by(x_delta: units) if safe_to_move?(x_delta: units)
    when orientation.north?, orientation.south?
      change_coordinates_by(y_delta: units) if safe_to_move?(y_delta: units)
    end
  end

  def change_orientation_by_angle(degrees)
    orientation.change_by_angle(degrees)
  end

  def to_s
    "#{coordinates} #{orientation}"
  end

  private

  attr_reader :plateau

  def safe_to_move?(x_delta: 0, y_delta: 0)
    plateau.within_bounds?(coordinates.x + x_delta, coordinates.y + y_delta)
  end

  def change_coordinates_by(x_delta: 0, y_delta: 0)
    [coordinates.x += x_delta, coordinates.y += y_delta]
  end
end
